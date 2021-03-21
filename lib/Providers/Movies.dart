import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dart:convert';

import '../models/movie.dart';

class Movies with ChangeNotifier {
  List _popular = [];
  List _upcoming = [];
  List _toprated = [];
  List _nowplaying = [];
  var _latest;

  final String apiurl = 'https://api.themoviedb.org/3';

  final apikey = env['API_KEY'].toString();

  List get popular {
    return [..._popular];
  }

  List get upcoming {
    return [..._upcoming];
  }

  List get toprated {
    return [..._toprated];
  }

  List get nowplaying {
    return [..._nowplaying];
  }

  get latest => _latest;

  void getmovieslist() {
    var client = http.Client();
    fetchLatestMovieList(client);
    fetchNowPlayingMovieList(client);
    fetchPopularMovieList(client);
    fetchTopRatedMovieList(client);
    fetchUpcomingMovieList(client);
  }

  //Method gets Movie Lists data from TMDB
  Future<void> fetchPopularMovieList(var client) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apikey&language=en-US&page=${1}');

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
              ))
          .toList();
      _popular = loaded;
      print(_popular);
      print("Loaded list from site: $loaded");
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchUpcomingMovieList(var client) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey&language=en-US&page=${1}');

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
              ))
          .toList();
      _upcoming = loaded;
      
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchTopRatedMovieList(var client) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey&language=en-US&page=${1}');

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
              ))
          .toList();
      _toprated = loaded;
      //print(_popular);
      //print("Loaded list from site: $loaded");
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchNowPlayingMovieList(var client) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$apikey&language=en-US&page=${1}');

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
              ))
          .toList();
      _nowplaying = loaded;
      //print(_popular);
      //print("Loaded list from site: $loaded");
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchLatestMovieList(var client) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/latest?api_key=$apikey&language=en-US');

    try {
      var response = await client.get(url);
      var results = json.decode(response.body) as Map<String, dynamic>;
      var load = Movie(
        backdroppath: results['backdrop_path'],
        id: results['id'],
        overview: results['overview'],
        releasedate: results['release_date'],
        tagline: '',
        title: results['title'],
        voteaverage: results['vote_average'],
        votecount: results['vote_count'],
        posterpath: results['poster_path'],
      );

      _latest = load;
      //print(_popular);
      //print("Loaded list from site: $loaded");
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
