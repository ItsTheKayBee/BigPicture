import 'dart:convert';
import 'package:big_picture/constants/config.dart';
import 'package:http/http.dart' as http;
import 'movieTilesModel.dart';
import 'movieDetails.dart';

class MovieDetailsModel {
  Future<MovieDetails> getMovieDetails(
      {required tmdbID, required contentType}) async {
    String type = '';
    if (contentType == Type.MOVIE) {
      type = 'movie';
    } else if (contentType == Type.TV) {
      type = 'tv';
    }
    final Uri uri = Uri.parse(
        '$BASE_URL/$type/$tmdbID?api_key=$API_KEY&append_to_response=videos,credits,recommendations');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      return MovieDetails.fromJson(map, contentType);
    }
    throw Exception('Failed to fetch $type');
  }
}
