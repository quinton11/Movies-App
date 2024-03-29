import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarouselWidget extends StatelessWidget {
  static const color = Color.fromRGBO(38, 192, 171, 1);
  CarouselWidget({
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
            (datalist == null && datalist.length < index)
                ? CircularProgressIndicator()
                : Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w780' +
                              datalist[index].posterpath,
                        ),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.play_circle_outline_sharp,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
            /*Positioned(
              child: Container(
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
                    fit: BoxFit.cover, //BoxFit.Fill
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w780' +
                          datalist[index].posterpath,
                    ),
                  ),
                ),
              ),
              left: 20,
              top: 135,
            ),*/

            /*Positioned(
              left: 100,
              top: 260,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      datalist[index].title,
                      style: TextStyle(
                        color: color, //white70
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    /*Text(
                      'Release: ' +
                          DateFormat('dd/MM/yyyy').format(
                            DateTime.parse(
                              datalist[index].releasedate,
                            ),
                          ),
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),*/
                  ],
                ),
              ),
            )*/
          ],
        ),
      ),
      options: CarouselOptions(
        height: 320,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        aspectRatio: 0.8,
        enlargeCenterPage: true,
        viewportFraction: 0.7,
      ),
    );
  }
}
