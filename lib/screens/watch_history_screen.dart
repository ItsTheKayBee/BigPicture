import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/models/movieTilesModel.dart';
import 'package:big_picture/widgets/movies_list_layout.dart';
import 'package:flutter/material.dart';

class WatchHistoryScreen extends StatelessWidget {
  final List<MovieTile> movieTiles = MovieTilesModel().allMovieTiles;
  final IconData headingIcon = Icons.verified_rounded;
  final String headingTitle = watchHistoryTitle;

  @override
  Widget build(BuildContext context) {
    return MoviesListLayout(
      headingIcon: headingIcon,
      headingTitle: headingTitle,
    );
  }
}
