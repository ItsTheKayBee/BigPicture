import 'package:big_picture/models/castTile.dart';
import 'package:big_picture/models/movieTile.dart';
import 'videoTile.dart';

class MovieDetails {
  final String originalLanguage;
  final String overview;
  final List castList;
  final List videos;
  final List recommendations;
  final int collectionId;

  MovieDetails({
    required this.originalLanguage,
    required this.overview,
    required this.castList,
    required this.videos,
    required this.recommendations,
    required this.collectionId,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json, contentType) {
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

    return MovieDetails(
      castList: castList,
      collectionId: json['belongs_to_collection']?['id'] ?? 0,
      originalLanguage: json['original_language'],
      overview: json['overview'],
      recommendations: recommendations,
      videos: videos,
    );
  }
}
