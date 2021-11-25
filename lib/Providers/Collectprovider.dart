import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dart:convert';

import '../models/collection.dart';

class CollectionProvider with ChangeNotifier {
  List _collections = [];

  List get collections {
    return [..._collections];
  }

  final String apiurl = 'https://api.themoviedb.org/3';

  final apikey = env['API_KEY'].toString();

  Future<List> fetchCollections(client, query) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/search/collection?api_key=$apikey&language=en-US&query=$query&page=1');

    try {
      var response = await client.get(url);

      var result = json.decode(response.body) as Map<String, dynamic>;

      var loaded = result['results']
          .map(
            (obj) => Collection(
              backdroppath: obj['backdrop_path'],
              id: obj['id'],
              name: obj['name'],
              posterpath: obj['poster_path'],
            ),
          )
          .toList();
      /*var obj = result['results'][0];
      print(page);
      var loaded = Collection(
        backdroppath: obj['backdrop_path'],
        id: obj['id'],
        name: obj['name'],
        posterpath: obj['poster_path'],
      );*/

      return loaded;
    } catch (error) {
      throw (error);
    }
  }

  Future fetchAllCollections() async {
    final List result = [];
    final List firstqueries = ['Pirates of the Caribbean', 'Lord of the Rings', 'Star Wars', 'Spider Man', 'Avengers'];
    var client = http.Client();
    for (int i = 0; i < firstqueries.length; i++) {
      result.addAll(
        await fetchCollections(client, firstqueries[i]),
      );
    }

    _collections = result;
  }
}
