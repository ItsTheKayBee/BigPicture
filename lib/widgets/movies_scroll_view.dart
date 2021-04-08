import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/widgets/movie_tile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MoviesScrollView extends StatefulWidget {
  final List<MovieTile> movieTiles;

  const MoviesScrollView({
    @required this.movieTiles,
  });

  @override
  _MoviesScrollViewState createState() => _MoviesScrollViewState();
}

class _MoviesScrollViewState extends State<MoviesScrollView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: movieCardHeight,
      child: Swiper(
        // external library to create scrollable list with snap effect
        itemBuilder: (BuildContext context, int index) => movieTileItem(
          movieTile: widget.movieTiles[index],
          currentIndex: _currentIndex,
          index: index,
        ),
        itemCount: widget.movieTiles.length,
        viewportFraction: 0.45,
        onIndexChanged: (int index) => setState(() {
          _currentIndex = index;
        }),
      ),
    );
  }
}
