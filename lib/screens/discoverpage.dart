import 'package:flutter/material.dart';
import 'package:movie_app/Providers/Discovprovider.dart';
import 'package:movie_app/widget/moviescroll_list.dart';
import 'package:movie_app/widget/tvscroll_list.dart';
import 'package:provider/provider.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final color = Color.fromRGBO(38, 192, 171, 1);
  var _isinit = true;
  var _isloading = false;

  Future<void> _refreshPage(BuildContext context) async {
    Provider.of<DiscProvider>(context, listen: false).fetchItems();
  }

  @override
  void didChangeDependencies() {
    if (_isinit) {
      setState(() {
        _isloading = true;
        _isinit = false;
      });
    }
    Provider.of<DiscProvider>(context).fetchItems().then((_) {
      if (this.mounted) {
        if (_isloading) {
          setState(() {
            _isloading = false;
          });
        }
      }
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final data = Provider.of<DiscProvider>(context);
    return RefreshIndicator(
      onRefresh: () => _refreshPage(context),
      child: _isloading
          ? Center(
              child: CircularProgressIndicator(
                color: color,
                backgroundColor: Colors.white,
              ),
            )
          : Container(
              width: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 14,
                      ),
                      MovieScrollWidget(
                        datalist: data.classicMovies,
                        title: "Explore Classics",
                        width: width,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Divider(
                        color: color,
                        height: 2,
                        indent: 30,
                        endIndent: 30,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      MovieScrollWidget(
                        datalist: data.futuremovies,
                        title: "Peak into the Future",
                        width: width,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Divider(
                        color: color,
                        height: 2,
                        indent: 30,
                        endIndent: 30,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      TvScrollList(
                        datalist: data.fanfavorite,
                        title: 'Fan Favorite Shows',
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
