import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/utilities/scroll_snap_list.dart';
import 'package:big_picture/widgets/movie_tile_item.dart';
import 'package:flutter/material.dart';

class MoviesScrollView extends StatelessWidget {
  final Future<List<MovieTile>> movieTiles;

  MoviesScrollView({
    required this.movieTiles,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: 420,
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
                  ),
                  itemCount: snapshot.data!.length,
                  itemSize: size.width * 0.6,
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
