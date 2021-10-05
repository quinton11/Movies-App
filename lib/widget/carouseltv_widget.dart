import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarouselTvWidget extends StatelessWidget {
  CarouselTvWidget({
    this.datalist,
    this.width,
  });
  final datalist;
  final width;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: datalist.length,
      itemBuilder: (context, index, realindex) => Container(
        //margin: EdgeInsets.symmetric(horizontal: 2),
        child: Stack(
          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
            ),
            datalist[index].backdroppath != null
                ? Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500' +
                              datalist[index].backdroppath,
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
            Positioned(
              child: datalist[index].posterpath != null
                  ? Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 8,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                        //color: Colors.pink,
                        image: DecorationImage(
                          fit: BoxFit.fill,
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
              left: 20,
              top: 135,
            ),
            Positioned(
              left: width / 2 - 10,
              top: 100,
              child: Icon(
                Icons.play_circle_fill_outlined,
                color: Colors.white,
                size: 40,
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
                      datalist[index].name,
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
                              datalist[index].firstairdate,
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
      options: CarouselOptions(
        height: 350,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        aspectRatio: 0.8,
        enlargeCenterPage: true,
        viewportFraction: 1,
      ),
    );
  }
}
