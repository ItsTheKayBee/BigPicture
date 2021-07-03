import 'dart:convert';

import '../utilities/utility.dart';

import '../constants/config.dart';
import '../constants/genre_list.dart';
import '../constants/strings.dart';
import 'movieTile.dart';

import 'package:http/http.dart' as http;

enum Explore {
  nowPlaying,
  newInRegion,
  popular,
  popularInRegion,
  popularTv,
  airingNowTv,
  recommendations,
  upcoming,
  upcomingInRegion
}

class MovieTilesModel {
  List<MovieTile> _movieTiles = [];

  Future<List<MovieTile>> getMovieList({required movieListType}) async {
    late final url;
    late final type;
    switch (movieListType) {
      case Explore.nowPlaying:
        url = '$BASE_URL/movie/now_playing?api_key=$API_KEY';
        type = Type.movie;
        break;
      case Explore.newInRegion:
        final isoCode = await getIsoCode();
        url = '$BASE_URL/movie/now_playing?api_key=$API_KEY&region=$isoCode';
        type = Type.movie;
        break;
      case Explore.popular:
        url = '$BASE_URL/movie/popular?api_key=$API_KEY';
        type = Type.movie;
        break;
      case Explore.popularInRegion:
        final isoCode = await getIsoCode();
        url = '$BASE_URL/movie/popular?api_key=$API_KEY&region=$isoCode';
        type = Type.movie;
        break;
      case Explore.popularTv:
        type = Type.tv;
        url = '$BASE_URL/tv/popular?api_key=$API_KEY';
        break;
      case Explore.airingNowTv:
        type = Type.tv;
        url = '$BASE_URL/tv/on_the_air?api_key=$API_KEY';
        break;
      case Explore.upcoming:
        type = Type.movie;
        url = '$BASE_URL/movie/upcoming?api_key=$API_KEY';
        break;
      case Explore.upcomingInRegion:
        type = Type.movie;
        final isoCode = await getIsoCode();
        url = '$BASE_URL/movie/upcoming?api_key=$API_KEY&region=$isoCode';
        break;
      case Explore.recommendations:
        //TODO: Make recommendations dynamic
        type = Type.movie;
        url = '$BASE_URL/movie/popular?api_key=$API_KEY';
        break;
      default:
        throw Exception('No valid list');
    }

    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> list = map["results"];
      List<dynamic> modifiedList = [];
      list.forEach((model) {
        if (model['poster_path'] != null) {
          modifiedList.add(model);
        }
      });
      return modifiedList
          .map((model) => MovieTile.fromJson(model, type))
          .toList();
    }
    throw Exception('Failed to load new movies');
  }

  String getGenre({required int genreId}) {
    try {
      return '${genreList[genreId]}';
    } catch (e) {
      throw Exception('Genre not found: $e');
    }
  }

  List<MovieTile> get allMovieTiles => _movieTiles;
}
