import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dart:convert';

import '../models/movie.dart';
import '../models/crew.dart';
import '../models/reviewer.dart';

class Movies with ChangeNotifier {
  List _popular = [];
  List _upcoming = [];
  List _toprated = [];
  List _nowplaying = [];
  List _actors = [];
  List _directors = [];
  List _writers = [];
  List _reviews = [];
  List _similarmovies = [];
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

  List get actors {
    return [..._actors];
  }

  List get directors {
    return [..._directors];
  }

  List get writers {
    return [..._writers];
  }

  List get reviews {
    return [..._reviews];
  }

  List get similarmovies {
    return [..._similarmovies];
  }

  get latest => _latest;

  Future<void> getmovieslist() async {
    var client = http.Client();
    await Future.wait([
      fetchLatestMovieList(client),
      fetchNowPlayingMovieList(client),
      fetchPopularMovieList(client),
      fetchTopRatedMovieList(client),
      fetchUpcomingMovieList(client),
    ]);
    /* fetchLatestMovieList(client);
    fetchNowPlayingMovieList(client);
    fetchPopularMovieList(client);
    fetchTopRatedMovieList(client);
    fetchUpcomingMovieList(client); */
  }

  void loadmoviedeatils(movieid) {
    var client = http.Client();
    getMovieCredits(client, movieid);
    getReviews(client, movieid);
    getsimilarMovies(client, movieid);
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
      /*print(_popular);
      print("Loaded list from site: $loaded");*/
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

  Future<void> getMovieCredits(client, movieid) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieid/credits?api_key=$apikey&language=en-US');

    try {
      var response = await client.get(url);
      var results = json.decode(response.body) as Map<String, dynamic>;
      var loaded = results['cast']
          .map(
            (key, cast) => Crew(
              castid: cast['cast_id'],
              character: cast['character'],
              gender: cast['gender'],
              id: cast['id'],
              kfd: cast['known_for_department'],
              name: cast['name'],
              profilepath: cast['profile_path'],
            ),
          )
          .toList();

      List actors = loaded.where((crew) => crew.kfd == 'Acting').toList();
      List writers = loaded.where((crew) => crew.kfd == 'Writer').toList();
      List directors = loaded.where((crew) => crew.kfd == 'Directing').toList();
      _actors = actors;
      _writers = writers;
      _directors = directors;
      notifyListeners();
    } catch (error) {}
  }

  Future<void> getReviews(client, movieid) async {
    var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/$movieid/reviews?api_key=$apikey&language=en-US',
    );

    try {
      var response = await client.get(url);
      var results = json.decode(response.body) as Map<String, dynamic>;
      var loaded = results['results']
          .map(
            (review) => Reviewer(
              author: review['author'],
              avatarpath: review['author_details']['avatar_path'],
              content: review['content'],
              createdat: review['created_at'],
              rating: review['author_details']['rating'],
              username: review['author_details']['username'],
            ),
          )
          .toList();

      _reviews = loaded;
      notifyListeners();
    } catch (error) {}
  }

  Future<void> getsimilarMovies(client, movieid) async {
    var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/$movieid/similar?api_key=$apikey&language=en-US',
    );

    try {
      var response = client.get(url);
      var results = json.decode(response.body) as Map<String, dynamic>;
      var loaded = results['results']
          .map(
            (result) => Movie(
              backdroppath: result['backdrop_path'],
              id: result['id'],
              overview: result['overview'],
              posterpath: result['poster_path'],
              releasedate: result['release_date'],
              tagline: '',
              title: result['title'],
              voteaverage: result['vote_average'],
              votecount: result['vote_count'],
            ),
          )
          .toList();
      _similarmovies = loaded;
      notifyListeners();
    } catch (error) {}
  }
}
