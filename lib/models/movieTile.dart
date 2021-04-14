import 'package:big_picture/constants/config.dart';

class MovieTile {
  final int movieId;
  final String imageUrl;
  final String movieName;
  final String voteAverage;

  MovieTile({
    required this.movieId,
    required this.imageUrl,
    required this.movieName,
    required this.voteAverage,
  });

  factory MovieTile.fromJson(Map<String, dynamic> json) {
    return MovieTile(
      movieId: json['id'],
      imageUrl: "$IMG_BASE_URL${json['poster_path']}",
      movieName: json['title'],
      voteAverage: json['vote_average'].toString(),
    );
  }
}
