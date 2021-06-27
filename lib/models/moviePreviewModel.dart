import 'dart:convert';

import 'package:big_picture/constants/config.dart';
import 'package:big_picture/models/preview.dart';
import 'movieTilesModel.dart';
import 'package:http/http.dart' as http;

class MoviePreviewModel {
  Future<String> getImdbID({required tmdbID, required contentType}) async {
    String type = '';
    if (contentType == Type.MOVIE) {
      type = 'movie';
    } else if (contentType == Type.TV) {
      type = 'tv';
    }
    final Uri uri =
        Uri.parse('$BASE_URL/$type/$tmdbID/external_ids?api_key=$API_KEY');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      return map["imdb_id"];
    }
    throw Exception('Failed to fetch IMDB ID');
  }

  Future<Preview> getPreview({required tmdbID, required contentType}) async {
    String imdbID = await getImdbID(tmdbID: tmdbID, contentType: contentType);
    final Uri uri = Uri.parse('$OMDB_BASE_URL/?apikey=$OMDB_API_KEY&i=$imdbID');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      return Preview.fromJson(map);
    }
    throw Exception('Failed to fetch preview');
  }
}
