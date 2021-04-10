import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:flutter/material.dart';

import 'movie_tile_item.dart';

class MoviesGridView extends StatelessWidget {
  final List<MovieTile> movieTiles;

  const MoviesGridView({@required this.movieTiles});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(
        left: size8,
        right: size8,
        bottom: size8 * 2 + size2,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.55,
        crossAxisSpacing: size4,
        mainAxisSpacing: size2,
      ),
      itemBuilder: (context, index) => Expanded(
        child: movieTileItem(
          movieTile: movieTiles[index],
        ),
      ),
      itemCount: movieTiles.length,
    );
  }
}
