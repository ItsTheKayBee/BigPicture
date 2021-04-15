import 'dart:convert';

import 'package:big_picture/constants/config.dart';
import 'package:big_picture/models/preview.dart';
import 'package:http/http.dart' as http;

class MoviePreviewModel {
  Future<String> getImdbID({required tmdbID}) async {
    final Uri uri =
        Uri.parse('$BASE_URL/movie/$tmdbID/external_ids?api_key=$API_KEY');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      return map["imdb_id"];
    }
    throw Exception('Failed to fetch IMDB ID');
  }

  Future<Preview> getPreview({required tmdbID}) async {
    String imdbID = await getImdbID(tmdbID: tmdbID);
    final Uri uri = Uri.parse('$OMDB_BASE_URL/?apikey=$OMDB_API_KEY&i=$imdbID');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      return Preview.fromJson(map);
    }
    throw Exception('Failed to fetch preview');
  }
}
