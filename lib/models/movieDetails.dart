import 'package:big_picture/models/castTile.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:flutter/foundation.dart';
import 'videoTile.dart';

class MovieDetails {
  final String originalLanguage;
  final String overview;
  final List castList;
  final List videos;
  final List recommendations;
  final List watchProviders;
  final int collectionId;
  final String collectionName;
  List collectionParts;
  final String tagline;

  MovieDetails({
    required this.originalLanguage,
    required this.overview,
    required this.castList,
    required this.videos,
    required this.recommendations,
    required this.collectionId,
    required this.collectionName,
    required this.collectionParts,
    required this.tagline,
    required this.watchProviders,
  });

  factory MovieDetails.fromJson(
      Map<String, dynamic> json, contentType, isoCode) {
    List<CastTile> castList = List<CastTile>.from(
      json['credits']['cast'].map((cast) => CastTile.fromJson(cast)),
    );
    List<MovieTile> recommendations = List<MovieTile>.from(
      json['recommendations']['results'].map(
          (recommendation) => MovieTile.fromJson(recommendation, contentType)),
    );
    List<VideoTile> videos = List<VideoTile>.from(
      json['videos']['results'].map((video) => VideoTile.fromJson(video)),
    );
    List<WatchProvider> watchProviders = List<WatchProvider>.from(
      json['watch/providers']['results'][isoCode]['flatrate']
          .map((watchProvider) => WatchProvider.fromJson(watchProvider)),
    );

    return MovieDetails(
      castList: castList,
      collectionId: json['belongs_to_collection']?['id'] ?? 0,
      collectionName: json['belongs_to_collection']?['name'] ?? '',
      collectionParts: [],
      originalLanguage: json['original_language'],
      overview: json['overview'],
      recommendations: recommendations,
      videos: videos,
      tagline: json['tagline'] ?? '',
      watchProviders: watchProviders,
    );
  }
}

class WatchProvider {
  final String logoPath;
  final int id;
  final String name;

  WatchProvider({
    required this.id,
    required this.logoPath,
    required this.name,
  });

  factory WatchProvider.fromJson(Map<String, dynamic> json) {
    return WatchProvider(
      id: json['provider_id'],
      logoPath: json['logo_path'] ?? '',
      name: json['provider_name'],
    );
  }
}

class Keyword {
  final int id;
  final String name;

  Keyword({
    required this.id,
    required this.name,
  });

  factory Keyword.fromJson(Map<String, dynamic> json) {
    return Keyword(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });
}
