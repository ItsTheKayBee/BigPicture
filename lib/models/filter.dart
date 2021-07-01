class Filter {
  List? genres;
  List? actors;
  List? directors;
  int? year;
  String? fromDate;
  String? toDate;
  List? keywords;

  Filter({
    this.actors,
    this.directors,
    this.fromDate,
    this.genres,
    this.keywords,
    this.toDate,
    this.year,
  });
}
