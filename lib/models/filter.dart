class Filter {
  List genres;
  List actors;
  List directors;
  int year;
  String fromDate;
  String toDate;
  List keywords;
  List watchProviders;
  int runtimeMax;
  int runtimeMin;

  Filter({
    this.actors = const [],
    this.directors = const [],
    this.fromDate = '',
    this.genres = const [],
    this.keywords = const [],
    this.watchProviders = const [],
    this.toDate = '',
    this.year = 0,
    this.runtimeMax = 0,
    this.runtimeMin = 0,
  });
}
