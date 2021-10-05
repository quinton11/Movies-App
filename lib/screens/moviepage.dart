import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/widget/carousel_widget.dart';
import 'package:provider/provider.dart';

import 'package:movie_app/widget/moviescroll_list.dart';
import 'package:movie_app/Providers/Movies.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final color = Color.fromRGBO(38, 192, 171, 1);
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
    Provider.of<Movies>(context).getmovieslist().then((_) {
      setState(() {
        _isloading = false;
      });
    });

    _isinit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshMovies(BuildContext context) async {
    Provider.of<Movies>(context, listen: false).getmovieslist();
  }

  @override
  Widget build(BuildContext context) {
    //print(poplist[0]);
    final width = MediaQuery.of(context).size.width;
    final moviedata = Provider.of<Movies>(context);
    return RefreshIndicator(
      onRefresh: () => _refreshMovies(context),
      child: _isloading
          ? Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(37, 43, 51, 1),
              ),
            )
          : Container(
              color: Colors.white,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        child: CarouselWidget(
                          datalist: moviedata.nowplaying,
                          width: width,
                        ),
                      ),
                      MovieScrollWidget(
                        datalist: moviedata.toprated,
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
                        datalist: moviedata.popular,
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
                        datalist: moviedata.upcoming,
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
                      /* MovieScrollWidget(
                  datalist: moviedata.nowplaying,
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
                ), */
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
