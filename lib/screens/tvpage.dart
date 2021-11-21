import 'package:flutter/material.dart';
import 'package:movie_app/Providers/Tvprovider.dart';
import 'package:provider/provider.dart';
import '../widget/tvscroll_list.dart';
import '../widget/carouseltv_widget.dart';

class TvPage extends StatefulWidget {
  @override
  _TvPageState createState() => _TvPageState();
}

class _TvPageState extends State<TvPage> {
  var _isinit = true;
  var _isloading = false;

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    if (_isinit) {
      setState(() {
        _isloading = true;
      });
    }
    Provider.of<TvProvider>(context).getLists().then((_) {
      if (this.mounted) {
        if (_isloading) {
          setState(() {
            _isloading = false;
          });
        }
      }
    });

    setState(() {
      _isinit = false;
    });

    super.didChangeDependencies();
  }

  Future<void> _refreshTV(BuildContext context) async {
    Provider.of<TvProvider>(context).getLists();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final tvdata = Provider.of<TvProvider>(context);
    return RefreshIndicator(
      onRefresh: () => _refreshTV(context),
      child: _isloading
          ? Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(37, 43, 51, 1),
                backgroundColor: Colors.white,
              ),
            )
          : Container(
              color: Colors.white,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: CarouselTvWidget(
                          datalist: tvdata.populartv,
                          width: width,
                        ),
                      ),
                      SizedBox(height: 20),
                      TvScrollList(
                        width: width,
                        datalist: tvdata.tvairingtoday,
                        title: 'Airing Today',
                      ),
                      TvScrollList(
                        width: width,
                        datalist: tvdata.topratedtv,
                        title: 'Top Rated',
                      ),
                      TvScrollList(
                        width: width,
                        datalist: tvdata.tvontheair,
                        title: 'On The Air',
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
