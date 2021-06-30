import 'dart:convert';
import '../constants/config.dart';
import '../constants/content_type.dart';
import '../models/movieTile.dart';
import 'package:http/http.dart' as http;
import 'movieDetails.dart';

class MovieDetailsModel {
  Future<MovieDetails> getMovieDetails(
      {required tmdbID, required contentType}) async {
    String type = '';
    if (contentType == Type.movie) {
      type = 'movie';
    } else if (contentType == Type.tv) {
      type = 'tv';
    }
    final Uri uri = Uri.parse(
        '$BASE_URL/$type/$tmdbID?api_key=$API_KEY&append_to_response=videos,credits,recommendations');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      MovieDetails movieDetails = MovieDetails.fromJson(map, contentType);
      int collectionId = movieDetails.collectionId;
      if (collectionId != 0) {
        List<MovieTile> collectionParts = await getCollection(
          collectionId: collectionId,
          contentType: contentType,
        );
        movieDetails.collectionParts = collectionParts;
      }
      return movieDetails;
    }
    throw Exception('Failed to fetch $type');
  }

  Future<List<MovieTile>> getCollection(
      {required int collectionId, required contentType}) async {
    final Uri uri =
        Uri.parse('$BASE_URL/collection/$collectionId?api_key=$API_KEY');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> parts = map["parts"];
      List<MovieTile> collectionParts =
          parts.map((part) => MovieTile.fromJson(part, contentType)).toList();
      collectionParts.sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
      return collectionParts;
    }
    throw Exception('Failed to fetch collection');
  }
}
