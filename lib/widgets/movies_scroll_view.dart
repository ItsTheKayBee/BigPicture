import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/utilities/scroll_snap_list.dart';
import 'package:big_picture/widgets/movie_tile_item.dart';
import 'package:flutter/material.dart';

class MoviesScrollView extends StatefulWidget {
  final List<MovieTile> movieTiles;

  const MoviesScrollView({
    required this.movieTiles,
  });

  @override
  _MoviesScrollViewState createState() => _MoviesScrollViewState();
}

class _MoviesScrollViewState extends State<MoviesScrollView> {
  int _currentIndex = 0;
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: 440,

          // external library to create scrollable list with snap effect
          child: ScrollSnapList(
            curve: Curves.easeOut,
            itemBuilder: (BuildContext context, int index) => MovieTileItem(
              movieTile: widget.movieTiles[index],
              currentIndex: _currentIndex,
              index: index,
            ),
            itemCount: widget.movieTiles.length,
            itemSize: size.width * 0.6,
            selectedItemAnchor: SelectedItemAnchor.START,
            onItemFocus: (i) {
              setState(() {
                _currentIndex = i;
              });
            },
          ),
        ),
        Positioned(
          right: 0,
          child: IgnorePointer(
            child: Container(
              height: 440,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.lighten,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.01),
                    Colors.white10,
                    Colors.white30,
                    Colors.white60,
                    Colors.white70,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
