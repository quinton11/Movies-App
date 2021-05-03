import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              )
            ],
          ),
        ),
      ),
    );
  }
}
