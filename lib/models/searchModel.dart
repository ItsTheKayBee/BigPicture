import 'dart:convert';

import 'package:big_picture/constants/config.dart';
import 'package:http/http.dart' as http;

import 'movieTile.dart';

class SearchModel {
  Future<List<MovieTile>> getSearchResults({required query}) async {
    if (query == '') {
      return [];
    }
    final String url = '$BASE_URL/search/movie?api_key=$API_KEY&query=$query';

    final Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> list = map["results"];
      return list.map((model) => MovieTile.fromJson(model)).toList();
    }
    throw Exception('Search failed');
  }
}
