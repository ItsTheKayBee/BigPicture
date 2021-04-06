import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/widgets/movie_tile_item.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class MoviesScrollView extends StatefulWidget {
  final List<MovieTile> movieTiles;

  const MoviesScrollView({
    @required this.movieTiles,
  });

  @override
  _MoviesScrollViewState createState() => _MoviesScrollViewState();
}

class _MoviesScrollViewState extends State<MoviesScrollView> {
  void _onItemFocus(int index) {
    setState(() {
      widget.movieTiles[index].focussed = true;

      if (index != 0) widget.movieTiles[index - 1].focussed = false;
      if (index != widget.movieTiles.length - 1)
        widget.movieTiles[index + 1].focussed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: movieCardHeight,
      child: ScrollSnapList(
        onItemFocus: _onItemFocus,
        itemSize: movieCardWidth,
        itemBuilder: (context, index) => MovieTileItem(
          movieTile: widget.movieTiles[index],
        ),
        itemCount: widget.movieTiles.length,
        dynamicItemSize: true,
        initialIndex: -1.0,
      ),
    );
  }
}
