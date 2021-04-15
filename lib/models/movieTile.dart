import 'package:big_picture/constants/config.dart';

class MovieTile {
  final int movieId;
  final String imageUrl;
  final String movieName;
  final String voteAverage;
  final bool isImageValid;

  MovieTile({
    required this.movieId,
    required this.imageUrl,
    required this.movieName,
    required this.voteAverage,
    this.isImageValid = true,
  });

  factory MovieTile.fromJson(Map<String, dynamic> json) {
    return MovieTile(
      movieId: json['id'],
      imageUrl: "$IMG_BASE_URL${json['poster_path']}",
      isImageValid: json['poster_path'] == null ? false : true,
      movieName: json['title'] ?? json['name'],
      voteAverage: json['vote_average'].toString(),
    );
  }
}
