import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/screens/moviedetails.dart';
import 'package:movie_app/screens/MoviesView.dart';
//import 'package:transparent_image/transparent_image.dart';

class MovieScrollWidget extends StatelessWidget {
  MovieScrollWidget({
    this.title, //
    this.datalist,
    this.width,
  });
  final title;
  final datalist;
  final double width;
  static const color = Color.fromRGBO(38, 192, 171, 1);

  String gettext(title) {
    if (title == 'Top rated') {
      return 'See the top rated movies';
    } else if (title == 'Popular') {
      return "This week's popular movies on TMDB";
    } else if (title == 'Upcoming') {
      return "Movies Releasing This Week";
    } else if (title == 'Now Playing') {
      return "Movies airing this week";
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width;
    //The Container housing the scrolllist
    return Container(
      height: 450,
      padding: EdgeInsets.all(8),
      color: Colors.white,
      width: width,
      //Column to hold the vertical structure of elements in container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            //Row holds the list title and view all button horizontally in container
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Container(
                      height: 20,
                      width: 5,
                      color: color,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: color,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoviesView(
                        data: datalist,
                        title: title,
                      ),
                    ),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          Text(
            gettext(title),
            style: TextStyle(
              color: color,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 350,
            width: width,
            padding: EdgeInsets.symmetric(vertical: 5),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetails(
                        movie: datalist[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 280,
                  width: 140,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Stack(
                    children: <Widget>[
                      //Container holding the movie poster path
                      Container(
                        height: 210,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: datalist[index].posterpath != null
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          datalist[index].posterpath,
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '${datalist[index].voteaverage.toStringAsFixed(1)}',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black, //white70
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  datalist[index].title,
                                  style: TextStyle(
                                    color: Colors.black, //white70
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      //'Release: ' +
                                      DateFormat('dd/MM/yyyy')
                                          .format(
                                            DateTime.parse(
                                              datalist[index].releasedate,
                                            ),
                                          )
                                          .split("/")
                                          .last,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    //Add Durations
                                  ],
                                ),
                                Center(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    height: 30,
                                    margin: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Icon(
                                          Icons.add,
                                          color: Colors.teal,
                                          size: 20,
                                        ),
                                        Text(
                                          'Watchlist',
                                          style: TextStyle(
                                              color: Colors.teal,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.teal),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        height: 110,
                        width: 140,
                        top: 210,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 8,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: 5,
              ),
              itemCount: datalist.length,
            ),
          ),
        ],
      ),
    );
  }
}
