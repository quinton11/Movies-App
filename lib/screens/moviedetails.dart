import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/Providers/Movies.dart';
import 'package:movie_app/widget/moviescroll_list.dart';
import 'package:provider/provider.dart';

import 'package:movie_app/widget/castscroll_list.dart';

class MovieDetails extends StatefulWidget {
  final movie;

  MovieDetails({
    this.movie,
  });

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final color = Color.fromRGBO(38, 192, 171, 1);
  var _isinit = true;
  var _isloading = false;

  final formatter = NumberFormat('#,###,000');

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
  void didChangeDependencies() {
    if (_isinit) {
      setState(() {
        _isloading = true;
      });
    }
    Provider.of<Movies>(context).loadmoviedetails(widget.movie.id).then((_) {
      if (this.mounted) {
        if (_isloading) {
          setState(() {
            _isloading = false;
          });
        }
      }
    });

    setState(() {
      _isinit = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final width = double.infinity;
    final data = Provider.of<Movies>(context);
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
          widget.movie.title,
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
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
                        widget.movie.title,
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
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
                                    widget.movie.releasedate,
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
                height: 80,
              ),
              Stack(
                children: <Widget>[
                  widget.movie.backdroppath != null
                      ? Container(
                          width: double.infinity,
                          height: 230,
                          decoration: BoxDecoration(
                            //color: Colors.teal,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    widget.movie.backdroppath,
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
                        )
                      : Center(
                          child: Text(
                            'N/A',
                            style: TextStyle(
                              color: Colors.black,
                            ),
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
                                      widget.movie.posterpath,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            //Movie about Section
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.movie.overview,
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
                margin: EdgeInsets.symmetric(vertical: 8),
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
                                  text: '${widget.movie.voteaverage}',
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
                            '${formatter.format(widget.movie.votecount)}',
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
              //Similar Movies Section
              Divider(
                color: color,
                height: 2,
                indent: 30,
                endIndent: 30,
              ),
              _isloading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Color.fromRGBO(37, 43, 51, 1),
                        backgroundColor: Colors.white,
                      ),
                    )
                  : MovieScrollWidget(
                      datalist: data.similarmovies,
                      title: "Similar Movies",
                      width: width,
                    ),
              CastList()
            ],
          ),
        ),
      ),
    );
  }
}
