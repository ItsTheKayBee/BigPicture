import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTilesModel.dart';
import 'package:big_picture/widgets/movies_scroll_view.dart';
import 'package:flutter/material.dart';

class MoviesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: size4,
            left: size4,
          ),
          child: Text(
            newMovies,
            style: headingFont,
          ),
        ),
        MoviesScrollView(
          movieTiles: MovieTilesModel().allMovieTiles,
        ),
      ],
    );
  }
}
