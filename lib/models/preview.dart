class Preview {
  final String title;
  final String year;
  final String runtime;
  final String plot;
  final List<Rating> ratings;

  Preview({
    required this.title,
    required this.year,
    required this.runtime,
    required this.plot,
    required this.ratings,
  });

  factory Preview.fromJson(Map<String, dynamic> json, String imdbID) {
    if (imdbID != '') {
      List<Rating> ratingsList = List<Rating>.from(
        json['Ratings'].map(
          (rating) => Rating.fromJson(rating),
        ),
      );
      return Preview(
        title: json['Title'],
        year: json['Year'],
        runtime: json['Runtime'],
        plot: json['Plot'],
        ratings: ratingsList,
      );
    } else {
      return Preview(
        title: json['title'] ?? json['name'],
        year: json['release_date']?.substring(0, 4),
        runtime: "$json['runtime']",
        plot: json['overview'],
        ratings: [],
      );
    }
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
