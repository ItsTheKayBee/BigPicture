import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/utilities/marquee.dart';
import 'package:flutter/material.dart';

Widget movieTileItem({
  @required MovieTile movieTile,
}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Image.asset(
            movieTile.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size1),
          child: MarqueeWidget(
            direction: Axis.horizontal,
            child: Text(
              movieTile.movieName,
              style: movieFont,
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size1),
          child: MarqueeWidget(
            child: Text(
              movieTile.movieGenres,
              style: genreFont,
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
          ),
        ),
      ],
    ),
  );
}
