import 'package:flutter/material.dart';

import '../widget/movie_scrollsection.dart';

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

