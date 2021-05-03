import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dart:convert';

import '../models/tv.dart';

class TvProvider with ChangeNotifier {
  List _tvairingtoday = [];
  List _tvontheair = [];
  List _populartv = [];
  List _topratedtv = [];

  final String apiurl = 'https://api.themoviedb.org/3/tv/airing_today';
  final apikey = env['API_KEY'].toString();

  List get tvairingtoday {
    return [..._tvairingtoday];
  }

  List get tvontheair {
    return [..._tvontheair];
  }

  List get populartv {
    return [..._populartv];
  }

  List get topratedtv {
    return [..._topratedtv];
  }

  void getLists() {
    var client = http.Client();
    tvAiringToday(client);
    tvOntheAir(client);
    popularTv(client);
    topRatedTv(client);
  }

  Future<void> tvAiringToday(client) async {
    var url = Uri.parse(apiurl + '?api_key=$apikey&language=en-US&page=1');
    //List<String> pages = ['1', '2', '3', '4', '5'];

    try {
      /*List responses = await Future.wait(pages.map(
        (e) => client
            .get(Uri.parse(apiurl + '?api_key=$apikey&language=en-US&page=$e')),
      ));*/

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
      _tvairingtoday = loaded;
      notifyListeners();
    } catch (error) {}
  }

  Future<void> tvOntheAir(client) async {
    var url = Uri.parse(apiurl + '?api_key=$apikey&language=en-US&page=1');
    //List<String> pages = ['1', '2', '3', '4', '5'];

    try {
      /*List responses = await Future.wait(pages.map(
        (e) => client
            .get(Uri.parse(apiurl + '?api_key=$apikey&language=en-US&page=$e')),
      ));*/

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
      //print(results);
      //print(results.length);
      _tvontheair = loaded;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> popularTv(client) async {
    var url = Uri.parse(apiurl + '?api_key=$apikey&language=en-US&page=1');
    //List<String> pages = ['1', '2', '3', '4', '5'];

    try {
      /*List responses = await Future.wait(pages.map(
        (e) => client
            .get(Uri.parse(apiurl + '?api_key=$apikey&language=en-US&page=$e')),
      ));*/

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
      _populartv = loaded;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> topRatedTv(client) async {
    var url = Uri.parse(apiurl + '?api_key=$apikey&language=en-US&page=1');
    //List<String> pages = ['1', '2', '3', '4', '5'];

    try {
      /*List responses = await Future.wait(pages.map(
        (e) => client
            .get(Uri.parse(apiurl + '?api_key=$apikey&language=en-US&page=$e')),
      ));*/

      //print(responses.length);

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
      _topratedtv = loaded;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}