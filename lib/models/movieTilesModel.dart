import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:big_picture/constants/config.dart';

import 'genre.dart';

import 'movieTile.dart';
import 'package:http/http.dart' as http;

class MovieTilesModel {
  List<MovieTile> _movieTiles = [];

  Future<List<MovieTile>> getNewMovies() async {
    var currentDate = DateTime.now();
    var oneMonthBefore = currentDate.subtract(Duration(days: 30));
    var dateFormat = DateFormat('yyyy-MM-dd');
    String formattedCurrentDate = dateFormat.format(currentDate);
    String oneMonthBeforeDate = dateFormat.format(oneMonthBefore);

    var url = Uri.parse(
        '$BASE_URL/discover/movie?sort_by=popularity.desc&api_key=$API_KEY&with_original_language=en&primary_release_date.gte=$oneMonthBeforeDate&primary_release_date.lte=$formattedCurrentDate');
    final response = await http.get(url);
    print('url: $url');
    print('code: ${response.statusCode}');
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> list = map["results"];
      return list.map((model) => MovieTile.fromJson(model)).toList();
    }
    throw Exception('Failed to load new movies');
  }

  Future<List<Genre>> getAllGenres() async {
    List<Genre> genreList = [];

    var url =
        Uri.parse('$BASE_URL/genre/movie/list?api_key=$API_KEY&language=en-US');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> list = map["genres"];
      genreList = list.map((model) => Genre.fromJson(model)).toList();
      return genreList;
    }
    throw Exception('Failed to load genre list');
  }

  List<MovieTile> get allMovieTiles => _movieTiles;
}
