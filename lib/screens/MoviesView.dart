import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:movie_app/screens/moviedetails.dart';

class MoviesView extends StatelessWidget {
  //const MoviesView({ Key? key }) : super(key: key);
  final data;
  final title;
  static const color = Color.fromRGBO(38, 192, 171, 1);
  MoviesView({
    this.data,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 5,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Color.fromRGBO(38, 192, 171, 1),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Container(
        width: width,
        child: ListView.builder(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: data.length,
          itemBuilder: (BuildContext ctx, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetails(
                    movie: data[index],
                  ),
                ),
              );
            },
            child: Container(
              width: width - 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: EdgeInsets.all(
                8,
              ),
              child: Container(
                height: 140,
                width: 280,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: data[index].posterpath != null
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        data[index].posterpath,
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
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
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
                                    '${data[index].voteaverage}',
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
                                data[index].title,
                                style: TextStyle(
                                  color: Colors.black, //white70
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
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
                                            data[index].releasedate,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
