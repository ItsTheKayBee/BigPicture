import 'dart:convert';
import 'package:big_picture/constants/config.dart';
import 'genre.dart';
import 'movieTile.dart';
import 'package:http/http.dart' as http;
import 'package:country_codes/country_codes.dart';

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

    switch (movieListType) {
      case Explore.nowPlaying:
        url = '$BASE_URL/movie/now_playing?api_key=$API_KEY';
        break;
      case Explore.newInRegion:
        final isoCode = await getIsoCode();
        url = '$BASE_URL/movie/now_playing?api_key=$API_KEY&region=$isoCode';
        break;
      case Explore.popular:
        url = '$BASE_URL/movie/popular?api_key=$API_KEY';
        break;
      case Explore.popularInRegion:
        final isoCode = await getIsoCode();
        url = '$BASE_URL/movie/popular?api_key=$API_KEY&region=$isoCode';
        break;
      case Explore.popularTv:
        url = '$BASE_URL/tv/popular?api_key=$API_KEY';
        break;
      case Explore.airingNowTv:
        url = '$BASE_URL/tv/on_the_air?api_key=$API_KEY';
        break;
      case Explore.upcoming:
        url = '$BASE_URL/movie/upcoming?api_key=$API_KEY';
        break;
      case Explore.upcomingInRegion:
        final isoCode = await getIsoCode();
        url = '$BASE_URL/movie/upcoming?api_key=$API_KEY&region=$isoCode';
        break;
      case Explore.recommendations:
        //TODO: Make recommendations dynamic
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


// this function return ISO code of country (US, IN, etc)
  Future getIsoCode() async {
    await CountryCodes.init();

    final CountryDetails details = CountryCodes.detailsForLocale();

    return details.alpha2Code;
  }

  List<MovieTile> get allMovieTiles => _movieTiles;
}
