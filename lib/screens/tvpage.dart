import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class TvPage extends StatelessWidget {
  final airingtoday;
  final ontheair;
  final popular;
  final toprated;

  TvPage({
    this.airingtoday,
    this.ontheair,
    this.popular,
    this.toprated,
  });

  @override
  Widget build(BuildContext context) {
    print(ontheair.length);
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        //color: Colors.amber,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500' +
                                ontheair[2].backdroppath,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: 180,
                        width: 120,
                        decoration: BoxDecoration(
                          //color: Colors.pink,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  ontheair[2].posterpath,
                            ),
                          ),
                        ),
                      ),
                      left: 20,
                      top: 115,
                    ),
                    Positioned(
                      left: width / 2 - 10,
                      top: 100,
                      child: Icon(
                        Icons.play_circle_fill_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Positioned(
                      left: 150,
                      top: 260,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              ontheair[2].name,
                              style: TextStyle(
                                color: Colors.white70,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'First Aired: ' +
                                  DateFormat('dd/MM/yyyy').format(
                                      DateTime.parse(ontheair[2].firstairdate)),
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.normal,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              TvScrollList(
                width: width,
                datalist: popular,
                title: 'Popular',
              ),
              TvScrollList(
                width: width,
                datalist: airingtoday,
                title: 'Airing Today',
              ),
              TvScrollList(
                width: width,
                datalist: toprated,
                title: 'Top Rated',
              ),
              TvScrollList(
                width: width,
                datalist: ontheair,
                title: 'On The Air',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TvScrollList extends StatelessWidget {
  const TvScrollList({
    Key key,
    @required this.width,
    this.datalist,
    this.title,
  }) : super(key: key);

  final double width;
  final datalist;
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(5),
      height: 300,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.amber,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 230,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                height: 230,
                width: 130,
                decoration: BoxDecoration(
                  //color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      //color: Colors.blue,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        /*image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  datalist[index].posterpath,
                            ),
                          ),*/
                      ),
                      child: datalist[index].posterpath != null
                          ? FadeInImage(
                              placeholder: MemoryImage(kTransparentImage),
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    datalist[index].posterpath,
                              ),
                            )
                          : Center(
                              child: Text(
                                'N/A',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                    Positioned(
                      top: 180,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            height: 50,
                            width: 130,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  width: 130,
                                  child: Text(
                                    datalist[index].name,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      '${datalist[index].voteaverage}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(width: 15),
              itemCount: datalist.length,
            ),
          ),
        ],
      ),
    );
  }
}
