import 'package:big_picture/constants/strings.dart';

class Preview {
  final String title;
  final String year;
  final String runtime;
  final String plot;
  final List<Rating> ratings;
  final int totalSeasons;

  Preview({
    required this.title,
    required this.year,
    required this.runtime,
    required this.plot,
    required this.ratings,
    required this.totalSeasons,
  });

  factory Preview.fromJson(Map<String, dynamic> json, String imdbID) {
    //OMDB way
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
        totalSeasons: int.parse(
            json['totalSeasons'] == 'N/A' ? '0' : json['totalSeasons'] ?? '0'),
      );
    }
    //else TMDB way
    else {
      return Preview(
        //title for movies & name for tv series as per tmdb api
        title: json['title'] ?? json['name'],

        //get the year only from the release date
        year: json['release_date']?.substring(0, 4) ?? defaultDate,

        //convert int duration to string
        runtime: json['runtime'].toString(),
        plot: json['overview'],

        //ratinsg do not exist in tmdb api
        ratings: [],

        //number of seasons
        totalSeasons: json['number_of_seasons'] ?? 0,
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
