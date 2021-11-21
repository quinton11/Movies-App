import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dart:convert';

import '../models/movie.dart';
import '../models/tv.dart';

class DiscProvider with ChangeNotifier {
  List _classicMovies = [];
  List _fanfavorite = [];
  List _futuremovies = [];

  final String apiurl = 'https://api.themoviedb.org/3';

  final apikey = env['API_KEY'].toString();

  List get classicMovies {
    return [..._classicMovies];
  }

  List get fanfavorite {
    return [..._fanfavorite];
  }

  List get futuremovies {
    return [..._futuremovies];
  }

  Future<void> fetchItems() async {
    var client = http.Client();
    await Future.wait([
      fetchClassicMovies(client),
      fetchFanFav(client),
      fetchFutureMovies(client),
    ]);
  }

  Future<void> fetchClassicMovies(client) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=$apikey&language=en-US&sort_by=release_date.asc&page=${1}');

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
                voteaverage: obj['vote_average'],
                votecount: obj['vote_count'],
                posterpath: obj['poster_path'],
                genres: obj['genres'],
              ))
          .toList();
      _classicMovies = loaded;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchFutureMovies(client) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=$apikey&language=en-US&sort_by=release_date.desc&page=${1}');

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
                voteaverage: obj['vote_average'],
                votecount: obj['vote_count'],
                posterpath: obj['poster_path'],
                genres: obj['genres'],
              ))
          .toList();
      _futuremovies = loaded;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchFanFav(client) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/discover/tv?api_key=$apikey&language=en-US&sort_by=popularity.desc&page=${1}');

    try {
      var response = await client.get(url);
      var results = json.decode(response.body) as Map<String, dynamic>;
      var loaded = results['results']
          .map((result) => Tv(
                backdroppath: result['backdrop_path'],
                id: result['id'],
                name: result['name'],
                popularity: result['popularity'],
                posterpath: result['poster_path'],
                voteaverage: result['vote_average'],
                firstairdate: result['first_air_date'],
              ))
          .toList();
      _fanfavorite = loaded;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
