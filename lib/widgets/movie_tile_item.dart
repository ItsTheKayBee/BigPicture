import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:flutter/material.dart';

class MovieTileItem extends StatelessWidget {
  final MovieTile movieTile;

  MovieTileItem({
    this.movieTile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: movieCardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Card(
              child: Image.asset(
                movieTile.imageUrl,
                fit: BoxFit.fill,
                color: movieTile.focussed ? transparentColor : unfocussedColor,
                colorBlendMode: BlendMode.lighten,
              ),
            ),
          ),
          SizedBox(height: size2),
          Padding(
            padding: EdgeInsets.only(left: size1),
            child: Text(
              movieTile.movieName,
              style: movieFont,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size1),
            child: Text(
              movieTile.movieGenres,
              style: genreFont,
            ),
          ),
        ],
      ),
    );
  }
}
