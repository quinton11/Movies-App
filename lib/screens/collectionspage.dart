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
              child: ListView.separated(
                itemBuilder: (BuildContext ctx, index) => Container(
                  width: width - 20,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: color,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: data.collections[index].posterpath != null
                            ? Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              data.collections[index]
                                                  .posterpath,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: Color.fromRGBO(0, 0, 0, 0.5),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Center(
                                      child: Text(
                                        data.collections[index].name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    left: 80,
                                    bottom: 20,
                                  )
                                ],
                              )
                            : Center(
                                child: Text(
                                  'N/A',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                      )
                    ],
                  ),
                ),
                itemCount: data.collections.length,
                separatorBuilder: (BuildContext ctx, index) => SizedBox(
                  height: 8,
                ),
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(5),
              )
              /*GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: data.collections.length,
                itemBuilder: (BuildContext ctx, index) => Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: color,
                      ),
                      child: data.collections[index].posterpath != null
                          ? Container(
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
                            ),
                    ),
                    Positioned(
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                      ),
                    )
                  ],
                ),
              ),*/
              //Add gridview builder
              ),
    );
  }
}
