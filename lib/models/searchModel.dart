import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/filter.dart';
import '../utilities/utility.dart';
import 'castTile.dart';
import 'movieTile.dart';
import '../constants/config.dart';
import '../constants/strings.dart';

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

  Future<List> getFilteredResults(
      {required Filter filter, required contentType}) async {
    String url = '';

    List? genres = filter.genres; //dropdown
    List? actors = filter.actors; //search
    List? directors = filter.directors; //search
    int? year = filter.year; //number slider
    int? runtimeMin = filter.runtimeMin; //slider range
    int? runtimeMax = filter.runtimeMax; //slider range
    String? fromDate = filter.fromDate; //slider range
    String? toDate = filter.toDate; //slider range
    List? keywords = filter.keywords; //search
    List? watchProviders = filter.watchProviders; //search

    if (contentType == Type.movie) {
      url = '$BASE_URL/discover/movie?api_key=$API_KEY';
      // appends director + actors
      if (actors.isNotEmpty && directors.isNotEmpty) {
        url += '&with_people=' + actors.join(',') + ',' + directors.join(',');
      } else if (actors.isNotEmpty) {
        //appends actors
        url += '&with_cast=' + actors.join(',');
      } else if (directors.isNotEmpty) {
        //appends directors
        url += '&with_crew=' + directors.join(',');
      }
      //appends year
      if (year != 0) {
        url += '&primary_release_year=$year';
      } else {
        if (fromDate != '') {
          //appends start date
          url += '&primary_release_date.gte=$fromDate-01-01';
        }
        if (toDate != '') {
          // appends end date
          url += '&primary_release_date.lte=$toDate-12-31';
        }
      }
    } else if (contentType == Type.tv) {
      url = '$BASE_URL/discover/tv?api_key=$API_KEY';
      if (fromDate != '') {
        //appends start date
        url += '&first_air_date.gte=$fromDate-01-01';
      }
      if (toDate != '') {
        // appends end date
        url += '&first_air_date.lte=$toDate-12-31';
      }
    } else {
      throw Exception('Filters only exist for movies and TV');
    }

    // appends genre ids
    if (genres.isNotEmpty) {
      url += '&with_genres=' + genres.join(',');
    }

    // with runtime atmax runtimeMax
    if (runtimeMax != 0) {
      url += '&with_runtime.lte=$runtimeMax';
    }

    //with runtime atleast runtimeMin
    url += '&with_runtime.gte=$runtimeMin';

    // appends keyword ids
    if (keywords.isNotEmpty) {
      url += '&with_keywords=' + keywords.join(',');
    }

    // appends watch providers ids
    if (watchProviders.isNotEmpty) {
      final String isoCode = await getIsoCode();
      url += '&with_watch_providers=' + watchProviders.join(',');
      url += '&watch_region=$isoCode';
      url += '&with_watch_monetization_types=flatrate';
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
    }
    throw Exception('No search results found');
  }


}
