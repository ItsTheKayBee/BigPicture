import 'dart:convert';

import '../constants/config.dart';
import '../constants/strings.dart';
import '../models/preview.dart';
import 'package:http/http.dart' as http;

class MoviePreviewModel {
  Future<List<Rating>> getRatings({required imdbID}) async {
    final Uri uri = Uri.parse('$OMDB_BASE_URL/?apikey=$OMDB_API_KEY&i=$imdbID');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<Rating> ratingsList = List<Rating>.from(
        map['Ratings'].map(
          (rating) => Rating.fromJson(rating),
        ),
      );
      return ratingsList;
    }
    throw Exception('Failed to fetch IMDB ID');
  }

  Future<Preview> getPreview({required tmdbID, required contentType}) async {
    final Uri uri;
    String type = '';
    if (contentType == Type.movie) {
      type = 'movie';
    } else if (contentType == Type.tv) {
      type = 'tv';
    }

    uri = Uri.parse(
        '$BASE_URL/$type/$tmdbID?api_key=$API_KEY&append_to_response=external_ids');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      String imdbID = map['external_ids']?['imdb_id'] ?? '';
      Preview preview = Preview.fromJson(map, contentType);
      if (imdbID != '') {
        List<Rating> ratings = await getRatings(imdbID: imdbID);
        preview.ratings = ratings;
      }
      return preview;
    }
    throw Exception('Failed to fetch preview');
  }
}
