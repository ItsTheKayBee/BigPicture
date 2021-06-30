import '../constants/strings.dart';
import '../constants/content_type.dart';

class Preview {
  final String title;
  final String year;
  final int runtime;
  final String plot;
  List<Rating> ratings;
  final int totalSeasons;
  final String status;

  Preview({
    required this.title,
    required this.year,
    required this.runtime,
    required this.plot,
    required this.ratings,
    required this.totalSeasons,
    required this.status,
  });

  factory Preview.fromJson(Map<String, dynamic> json, contentType) {
    String title = '';
    String year = '';
    String status = '';
    int runtime = 0;

    if (contentType == Type.movie) {
      //for movies
      title = json['title'] ?? '';
      year = json['release_date'] != ''
          ? json['release_date']?.substring(0, 4)
          : defaultDate;
      runtime = json['runtime'];
      status = json['status'] ?? '';
    } else if (contentType == Type.tv) {
      //for tv
      title = json['name'] ?? '';
      status = json['status'] ?? '';
      String firstAirDate = json['first_air_date'] != ''
          ? json['first_air_date']?.substring(0, 4)
          : defaultDate;
      String lastAirDate = json['last_air_date'] != ''
          ? json['last_air_date']?.substring(0, 4)
          : defaultDate;
      if (firstAirDate == defaultDate) {
        year = hyphen;
      } else if (firstAirDate == lastAirDate && status != 'Returning Series') {
        //if only for one year
        year = firstAirDate;
      } else if (status == 'Returning Series') {
        //if ongoing
        year = firstAirDate + '-';
      } else {
        // if finished
        year = firstAirDate + '-' + lastAirDate;
      }
    }

    return Preview(
      //title for movies & name for tv series as per tmdb api
      title: title,

      //get the year only from the release date
      year: year,

      //convert int duration to string
      runtime: runtime,

      plot: json['overview'],

      //ratinsg do not exist in tmdb api
      ratings: [],

      status: status,

      //number of seasons
      totalSeasons: json['number_of_seasons'] ?? 0,
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
