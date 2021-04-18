import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/utilities/scroll_snap_list.dart';
import 'package:big_picture/widgets/movie_tile_item.dart';
import 'package:flutter/material.dart';

class MoviesScrollView extends StatelessWidget {
  final Future<List<MovieTile>> movieTiles;
  final double containerHeight;
  final double posterWidth;

  MoviesScrollView({
    required this.movieTiles,
    required this.containerHeight,
    required this.posterWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      child: FutureBuilder<List<MovieTile>>(
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
                // external library to create scrollable list with snap effect
                return ScrollSnapList(
                  curve: Curves.easeOut,
                  itemBuilder: (BuildContext context, int index) =>
                      MovieTileItem(
                    movieTile: snapshot.data![index],
                    posterWidth: posterWidth,
                    posterHeight: containerHeight - 80,
                  ),
                  itemCount: snapshot.data!.length,
                  itemSize: posterWidth,
                  selectedItemAnchor: SelectedItemAnchor.START,
                  onItemFocus: (_) {},
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text('no data');
              } else {
                return Text('uncaught');
              }
            default:
              return Text('Default');
          }
        },
      ),
    );
  }
}
