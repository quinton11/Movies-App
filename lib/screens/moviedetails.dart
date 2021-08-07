import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  final movie;

  MovieDetails({
    this.movie,
  });
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 380,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 300,
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
                  top: 180,
                  left: 20,
                  child: Container(
                    height: 180,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      //color: Colors.amber,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500' + movie.posterpath,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: width / 2 - 20,
                  top: 120,
                  child: Icon(
                    Icons.play_circle_fill_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back'))
          ],
        ),
      ),
    );
  }
}
