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
    var url = Uri.https('https://api.themoviedb.org/3',
        '/movie/popular/$apikey&language=en-US&page=1');
    var client = http.Client();
    try {
      var response = await client.get(url);
      print(json.decode(response.body));
    } catch (error) {
      throw (error);
    }
  }
}
