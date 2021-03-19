import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

import 'dart:convert';

import '../models/movie.dart';

class Movies with ChangeNotifier {
  List<Movie> _popular = [];
  List<Movie> _upcoming = [];
  List<Movie> _toprated = [];
  List<Movie> _latest = [];
  List<Movie> _nowplaying = [];

  final String apiurl = 'https://api.themoviedb.org/3';
  final apikey = FlutterConfig.get('API_KEY');

  List<Movie> get popular {
    return [..._popular];
  }

  List<Movie> get upcoming {
    return [..._upcoming];
  }

  List<Movie> get toprated {
    return [..._toprated];
  }

  List<Movie> get nowplaying {
    return [..._nowplaying];
  }

  List<Movie> get latest {
    return [..._latest];
  }

  //Method gets Movie Lists data from TMDB
  Future<void> fetchMoviesList() async {
    /*var url = Uri.https('https://api.themoviedb.org/3',
        '/movie/popular?api_key=0962b14981c91748a0b2c79d6c0227c1&language=en-US&page=${1}');*/
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=0962b14981c91748a0b2c79d6c0227c1&language=en-US&page=${1}');
    var client = http.Client();
    try {
      var response = await client.get(url);
      var results = json.decode(response.body) as Map<String, dynamic>;
      var loaded = results['results']
          .map((obj) => Movie(
                backdroppath: obj['backdrop_path'],
                id: obj['id'],
                overview: obj['overview'],
                releasedate: obj['release_date'],
                tagline: '',
                title: obj['title'],
                voteaverage: obj['vote_averate'],
                votecount: obj['votecount'],
                posterpath: obj['poster_path'],
              ))
          .toList();
      _popular = loaded;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
