import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:flutter/material.dart';

import 'cast_tile_item.dart';
import 'movie_cast_view_clipper.dart';

class MoviesDetailScrollView extends StatelessWidget {
  const MoviesDetailScrollView({
    @required this.size,
    @required this.offset,
    @required this.movieTiles,
    @required this.color,
  });

  final Size size;
  final double offset;
  final List<MovieTile> movieTiles;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MovieCastViewClipper(),
      child: Container(
        color: color,
        height: 470,
        width: size.width,
        padding: EdgeInsets.only(
          top: 70,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(left: offset),
              child: Text(
                'Cast',
                style: movieDetailsSectionTitle,
              ),
            ),
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.only(left: offset),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return CastTileItem(
                    movieTile: movieTiles[index],
                  );
                },
                itemCount: movieTiles.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
