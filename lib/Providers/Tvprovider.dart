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

  Future<void> tvAiringToday(client) async {
    var url = Uri.parse(apiurl + '$apikey&language=en-US&page=1');
    List<String> pages = ['1', '2', '3', '4', '5'];

    try {
      List responses = await Future.wait(pages.map(
        (e) => client.get(Uri.parse(apiurl + '$apikey&language=en-US&page=$e')),
      )); 
      /*var response = await client.get(url);
      var results = json.decode(response.body);
      tvairingtoday.add(
        Tv(
          backdroppath: results['results']['backdrop_path'],
          firstairdate: results['results']['first_air_date'],
          id: results['results']['id'],
          name: results['results']['name'],
          popularity: results['results']['popularity'],
          posterpath: results['results']['poster_path'],
          voteaverage: results['results']['vote_average'],
        ),
      );*/
    } catch (error) {}
  }
}
