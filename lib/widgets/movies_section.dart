import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTilesModel.dart';
import 'package:big_picture/utilities/marquee.dart';
import 'package:big_picture/widgets/movies_scroll_view.dart';
import 'package:flutter/material.dart';

class MoviesSection extends StatelessWidget {
  final sectionTitle;

  MoviesSection({@required this.sectionTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: size6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: size4,
              left: size4,
            ),
            child: Text(
              sectionTitle,
              style: sectionTitleStyle,
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
          ),
          MoviesScrollView(
            movieTiles: MovieTilesModel().allMovieTiles,
          ),
        ],
      ),
    );
  }
}
