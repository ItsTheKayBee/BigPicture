import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/models/movieTilesModel.dart';
import 'package:big_picture/widgets/movies_scroll_view.dart';
import 'package:flutter/material.dart';

class MoviesSection extends StatefulWidget {
  final sectionTitle;
  final movieListType;
  final double containerHeight;
  final double posterWidth;

  MoviesSection({
    required this.sectionTitle,
    required this.movieListType,
    this.containerHeight = 320,
    this.posterWidth = 180,
  });

  @override
  _MoviesSectionState createState() => _MoviesSectionState();
}

class _MoviesSectionState extends State<MoviesSection> {
  MovieTilesModel movieTilesModel = MovieTilesModel();
  late Future<List<MovieTile>> moviesList;

  @override
  void initState() {
    super.initState();
    try {
      moviesList =
          movieTilesModel.getMovieList(movieListType: widget.movieListType);
      print('init');
    } on Exception catch (_) {
      print('exception');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('built');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: size8,
            top: 20,
            bottom: 8,
          ),
          child: Text(
            widget.sectionTitle,
            style: sectionTitleStyle,
          ),
        ),
        MoviesScrollView(
          movieTiles: moviesList,
          posterWidth: widget.posterWidth,
          containerHeight: widget.containerHeight,
        ),
      ],
    );
  }
}
