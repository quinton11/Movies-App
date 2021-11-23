import 'package:flutter/material.dart';
import 'package:movie_app/Providers/Collectprovider.dart';
import 'package:provider/provider.dart';

class CollectionsPage extends StatefulWidget {
  @override
  _CollectionsPageState createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  final color = Color.fromRGBO(38, 192, 171, 1);
  var _isinit = true;
  var _isloading = false;

  @override
  void didChangeDependencies() {
    if (_isinit) {
      setState(() {
        _isloading = true;
        _isinit = false;
      });
    }
    Provider.of<CollectionProvider>(context).fetchAllCollections().then((_) {
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

  Future<void> _refreshPage(BuildContext context) async {
    Provider.of<CollectionProvider>(context, listen: false)
        .fetchAllCollections();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CollectionProvider>(context);
    final width = double.infinity;
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
              padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              color: Colors.white,
              child:
              //Add gridview builder 
              ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    color: color,
                  ),
                  height: 250,
                  width: width,
                  child: data.collections[index].posterpath != null
                      ? Container(
                          height: 230,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    data.collections[index].posterpath,
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Text(
                            'N/A',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ), /*Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      data.collections[index].posterpath != null
                          ? Container(
                              height: 150,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        data.collections[index].posterpath,
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: Text(
                                'N/A',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                      /*Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              width: 200,
                              child: Text(
                                data.collections[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),*/
                    ],
                  ),*/
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                itemCount: data.collections.length,
              ),
              /*Center(
                child: Text(
                  'Collections',
                  style: TextStyle(
                    color: Colors.amber,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),*/
            ),
    );
  }
}
