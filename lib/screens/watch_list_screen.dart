import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/models/movieTilesModel.dart';
import 'package:big_picture/widgets/movie_tile_item.dart';
import 'package:flutter/material.dart';

class WatchListScreen extends StatelessWidget {
  final List<MovieTile> movieTiles = MovieTilesModel().allMovieTiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: size6),
      child: Column(
        children: [
          Expanded(
            child: Text('Watch List'),
            flex: 2,
          ),
          Expanded(
            flex: 8,
            child: GridView.builder(
              padding: EdgeInsets.all(size4),
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
            ),
          ),
        ],
      ),
    );
  }
}
