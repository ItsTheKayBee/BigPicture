import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/models/movieTilesModel.dart';
import 'package:big_picture/widgets/movies_list_layout.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final List<MovieTile> movieTiles = MovieTilesModel().allMovieTiles;

  @override
  Widget build(BuildContext context) {
    return MoviesListLayout(
      headingTitle: searchTitle,
      headingIcon: Icons.search,
      isChoiceChipGroupPresent: true,
    );
  }
}
