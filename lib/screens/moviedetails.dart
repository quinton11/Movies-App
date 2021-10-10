import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieDetails extends StatelessWidget {
  final movie;
  final color = Color.fromRGBO(38, 192, 171, 1);
  final formatter = NumberFormat('#,###,000');

  MovieDetails({
    this.movie,
  });

  void handleClick(String value) {
    switch (value) {
      case 'Add to List':
        break;
      case 'Add a Review':
        break;
      case 'Check In':
        break;
      case 'Share':
        break;
    }
  }

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
          movie.title,
          style: TextStyle(
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Add to List', 'Add a Review', ' Check In', 'Share'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      movie.title,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          //'Release: ' +
                          DateFormat('dd/MM/yyyy')
                              .format(
                                DateTime.parse(
                                  movie.releasedate,
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
                      ),
                      //Add Durations
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              height: 130,
            ),
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    //color: Colors.teal,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500' + movie.backdroppath,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: width / 2 - 20,
                  top: 80,
                  child: Icon(
                    Icons.play_circle_fill_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ],
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    movie.posterpath,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          //Movie about Section
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movie.overview,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              softWrap: true,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                              ),
                            ),
                          ),
                          fit: FlexFit.loose,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    height: 40,
                    width: width - 20,
                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Add to Watchlist',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal,
                              fontSize: 18),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: color,
              height: 2,
              indent: 30,
              endIndent: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 25,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '${movie.voteaverage}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '/10',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black, //white70
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          '${formatter.format(movie.votecount)}',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black, //white70
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.normal,
                            letterSpacing: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.amber,
                          size: 25,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Rate This',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black, //white70
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Make Divider then crew section for movie
          ],
        ),
      ),
    );
  }
}
