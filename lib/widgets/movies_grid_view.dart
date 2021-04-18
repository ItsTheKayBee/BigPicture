import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:flutter/material.dart';

import 'movie_tile_item.dart';

class MoviesGridView extends StatelessWidget {
  final Future<List<MovieTile>> movieTiles;
  final double posterWidth = 180;
  final double posterHeight = 320;

  const MoviesGridView({required this.movieTiles});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieTile>>(
      future: movieTiles,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasData) {
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
                itemBuilder: (context, index) => MovieTileItem(
                  movieTile: snapshot.data![index],
                  posterWidth: posterWidth,
                  posterHeight: posterHeight,
                ),
                itemCount: snapshot.data!.length,
              );
            } else {
              return Text('${snapshot.error}');
            }
          default:
            return Text('default');
        }
      },
    );
  }
}
