import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/widgets/movie_tile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MoviesScrollView extends StatelessWidget {
  final List<MovieTile> movieTiles;

  const MoviesScrollView({
    @required this.movieTiles,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: movieCardHeight,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) => movieTileItem(
          movieTile: movieTiles[index],
        ),
        itemCount: movieTiles.length,
        viewportFraction: 0.45,
        scale: 0.60,
        fade: 0.05,
      ),
    );
  }
}
