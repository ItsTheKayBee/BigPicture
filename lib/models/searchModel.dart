import 'dart:convert';

import 'package:http/http.dart' as http;
import 'castTile.dart';
import 'movieTile.dart';
import '../constants/config.dart';
import '../constants/content_type.dart';

class SearchModel {
  Future<List> getSearchResults(
      {required String query, required contentType}) async {
    if (query == '') {
      return [];
    }
    final String url;
    if (contentType == Type.movie) {
      url = '$BASE_URL/search/movie?api_key=$API_KEY&query=$query';
    } else if (contentType == Type.tv) {
      url = '$BASE_URL/search/tv?api_key=$API_KEY&query=$query';
    } else {
      url = '$BASE_URL/search/person?api_key=$API_KEY&query=$query';
    }

    final Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> list = map["results"];
      if (contentType == Type.movie || contentType == Type.tv)
        return list
            .map((model) => MovieTile.fromJson(model, contentType))
            .toList();
      else
        return list.map((model) => CastTile.fromJson(model)).toList();
    }
    throw Exception('No search results found');
  }
}
