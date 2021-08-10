import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/widget/moviescroll_list.dart';

import '../widget/movie_scrollsection.dart';
//import '../widget/tvscroll_list.dart';

class MoviePage extends StatelessWidget {
  final poplist;
  final upcominglist;
  final topratedlist;
  final nowplayinglist;
  final latest;
  final color = Color.fromRGBO(38, 192, 171, 1);
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
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white70,
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
                                upcominglist[2].backdroppath,
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
                                  upcominglist[2].posterpath,
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
                              upcominglist[2].title,
                              style: TextStyle(
                                color: Colors.black, //white70
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Release: ' +
                                  DateFormat('dd/MM/yyyy').format(
                                    DateTime.parse(
                                      upcominglist[3].releasedate,
                                    ),
                                  ),
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
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
              SizedBox(
                height: 30,
              ),
              MovieScrollWidget(
                datalist: topratedlist,
                title: 'Top rated',
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
                datalist: poplist,
                title: 'Popular',
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
                datalist: upcominglist,
                title: 'Upcoming',
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
                datalist: nowplayinglist,
                title: 'Now Playing',
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
            ],
          ),
        ),
      ),
    );
  }
}
