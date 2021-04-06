import 'movieTile.dart';

class MovieTilesModel {
  List<MovieTile> _movieTiles = [
    MovieTile(
      imageUrl: 'assets/wonder.jpg',
      movieName: "Wonder woman",
      movieGenres: "Action, Adeventure",
    ),
    MovieTile(
      imageUrl: 'assets/wonder.jpg',
      movieName: "Wonder woman",
      movieGenres: "Action, Adeventure",
    ),
    MovieTile(
      imageUrl: 'assets/wonder.jpg',
      movieName: "Wonder woman",
      movieGenres: "Action, Adeventure",
    ),
    MovieTile(
      imageUrl: 'assets/wonder.jpg',
      movieName: "Wonder woman",
      movieGenres: "Action, Adeventure",
    ),
    MovieTile(
      imageUrl: 'assets/wonder.jpg',
      movieName: "Wonder woman",
      movieGenres: "Action, Adeventure",
    ),
  ];

  List<MovieTile> get allMovieTiles => _movieTiles;
  int get length => _movieTiles.length;
}
