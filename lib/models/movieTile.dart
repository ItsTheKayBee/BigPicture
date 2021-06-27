class MovieTile {
  final int movieId;
  final String imageUrl;
  final String movieName;
  final List genre;
  final type;

  MovieTile({
    required this.movieId,
    required this.imageUrl,
    required this.movieName,
    required this.genre,
    required this.type,
  });

  factory MovieTile.fromJson(Map<String, dynamic> json, contentType) {
    return MovieTile(
      // TMDB ID
      movieId: json['id'],

      // set to empty string if null
      imageUrl: json['poster_path'] ?? '',

      //title for movies & name for tv series as per tmdb api
      movieName: json['title'] ?? json['name'],

      // tmdb genre
      genre: json['genre_ids'],

      //content type
      type: contentType,
    );
  }
}
