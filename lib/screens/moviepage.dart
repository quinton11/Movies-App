import 'dart:ui';

import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  final poplist;
  final upcominglist;
  final topratedlist;
  final nowplayinglist;
  final latest;
  MoviePage({
    this.poplist,
    this.nowplayinglist,
    this.topratedlist,
    this.upcominglist,
    this.latest,
  });
  @override
  Widget build(BuildContext context) {
    //print(poplist[0]);
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              ScrollSection(
                datalist: topratedlist,
                title: 'Top rated',
              ),
              SizedBox(
                height: 14,
              ),
              Divider(
                color: Colors.amber,
                height: 2,
                indent: 30,
                endIndent: 30,
              ),
              SizedBox(
                height: 14,
              ),
              ScrollSection(
                datalist: poplist,
                title: 'Popular',
              ),
              SizedBox(
                height: 14,
              ),
              Divider(
                color: Colors.amber,
                height: 2,
                indent: 30,
                endIndent: 30,
              ),
              SizedBox(
                height: 14,
              ),
              ScrollSection(
                datalist: upcominglist,
                title: 'Upcoming',
              ),
              SizedBox(
                height: 14,
              ),
              Divider(
                color: Colors.amber,
                height: 2,
                indent: 30,
                endIndent: 30,
              ),
              SizedBox(
                height: 14,
              ),
              ScrollSection(
                datalist: nowplayinglist,
                title: 'Now Playing',
              ),
              SizedBox(
                height: 14,
              ),
              Divider(
                color: Colors.amber,
                height: 2,
                indent: 30,
                endIndent: 30,
              ),
              SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScrollSection extends StatelessWidget {
  const ScrollSection({
    this.title,
    Key key,
    @required this.datalist,
  }) : super(key: key);

  final datalist;
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.amber,
                      fontFamily: 'Montserrat',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 360,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                width: 180,
                height: 360,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500' +
                                datalist[index].posterpath,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 280,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Container(
                            height: 80,
                            width: 180,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  width: 180,
                                  child: Text(
                                    '#${index + 1} \n ${datalist[index].title}',
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
                                    SizedBox(width: 10),
                                    Text(
                                      '${datalist[index].voteaverage}',
                                      style: TextStyle(
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
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: 15,
              ),
              itemCount: datalist.length,
            ),
          )
        ],
      ),
    );
  }
}
