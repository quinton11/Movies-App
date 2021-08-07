import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

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
  static const color = Color.fromRGBO(38, 192, 171, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(5),
      height: 300,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: color,
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
                                      color: Colors.black,//white70
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
                                        color: Colors.black,//white70
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
