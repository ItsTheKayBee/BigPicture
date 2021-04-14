import 'package:big_picture/constants/config.dart';

import 'genre.dart';

class MovieTile {
  final int movieId;
  final String imageUrl;
  final String movieName;
  final List<Genre> movieGenres;

  MovieTile({
    required this.movieId,
    required this.imageUrl,
    required this.movieName,
    required this.movieGenres,
  });

  factory MovieTile.fromJson(Map<String, dynamic> json) {
    return MovieTile(
      movieId: json['id'],
      imageUrl: "$IMG_BASE_URL${json['poster_path']}",
      movieName: json['original_title'],
      movieGenres: json['genre_ids'].cast<Genre>(),
    );
  }
}
