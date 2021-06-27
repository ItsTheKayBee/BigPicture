class Preview {
  final String title;
  final String year;
  final String runtime;
  final String genre;
  final String plot;
  final List<Rating> ratings;

  Preview({
    required this.title,
    required this.year,
    required this.runtime,
    required this.genre,
    required this.plot,
    required this.ratings,
  });

  factory Preview.fromJson(Map<String, dynamic> json) {
    List<Rating> ratingsList = List<Rating>.from(
      json['Ratings'].map(
        (rating) => Rating.fromJson(rating),
      ),
    );
    return Preview(
      title: json['Title'],
      year: json['Year'],
      runtime: json['Runtime'],
      genre: json['Genre'],
      plot: json['Plot'],
      ratings: ratingsList,
    );
  }
}

class Rating {
  final String source;
  final String value;
  Rating({
    required this.source,
    required this.value,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      source: json['Source'],
      value: json['Value'],
    );
  }
}
