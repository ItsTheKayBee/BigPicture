import 'package:flutter/material.dart';

import '../constants/styles.dart';
import '../constants/strings.dart';
import 'movie_tile_item.dart';
import 'cast_tile_item.dart';

class MoviesGridView extends StatelessWidget {
  final Future<List> items;
  final contentType;
  static const double posterWidth = 200;
  static const double posterHeight = 260;

  const MoviesGridView({required this.items, required this.contentType});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: items,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return GridView.builder(
            padding: EdgeInsets.only(
              left: size4,
              bottom: size8 * 2 + size2,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: contentType == Type.people ? 0.6 : 0.56,
              crossAxisSpacing: size2,
              mainAxisSpacing: size2,
            ),
            itemBuilder: (context, index) {
              if (contentType == Type.movie || contentType == Type.tv) {
                return MovieTileItem(
                  movieTile: snapshot.data?[index],
                  posterWidth: posterWidth,
                  posterHeight: posterHeight,
                );
              }
              return CastTileItem(
                castTile: snapshot.data?[index],
                posterWidth: posterWidth,
                posterHeight: posterHeight,
              );
            },
            itemCount: snapshot.data!.length,
          );
        else
          return Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}
