class MovieDetails {
  final String imageUrl;
  final String title;
  final String releaseDate;
  final String runtime;
  final String originalLanguage;
  // final List genres;
  final String overview;
  final List castList;
  final List videos;
  final List recommendations;
  final int collectionId;

  MovieDetails({
    required this.title,
    required this.releaseDate,
    required this.runtime,
    required this.originalLanguage,
    // required this.genres,
    required this.overview,
    required this.castList,
    required this.videos,
    required this.recommendations,
    required this.collectionId,
    required this.imageUrl,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      // set to empty string if null
      imageUrl: json['poster_path'] ?? '',
      title: json['title'],
      releaseDate: json['release_date'],
      castList: [],
      collectionId:
          json['belongs_to_collection'] ? json['belongs_to_collection'].id : 0,
      // genres: [],
      originalLanguage: json['original_language'],
      overview: json['overview'],
      recommendations: json['recommendations'].results,
      runtime: json['runtime'],
      videos: json['videos'].results,
    );
  }
}
