import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/widget/carousel_widget.dart';
import 'package:movie_app/widget/carouseltv_widget.dart';
import 'package:movie_app/widget/moviescroll_list.dart';

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
                child: CarouselTvWidget(
                  datalist: nowplayinglist,
                  width: width,
                ),
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
