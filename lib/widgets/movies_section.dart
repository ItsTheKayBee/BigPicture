import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/models/movieTilesModel.dart';
import 'package:big_picture/widgets/movies_scroll_view.dart';
import 'package:flutter/material.dart';

class MoviesSection extends StatefulWidget {
  final sectionTitle;
  final movieListType;

  MoviesSection({required this.sectionTitle, required this.movieListType});

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
      moviesList = movieTilesModel.getMovieList(movieListType: widget.movieListType);
    } on Exception catch (_) {
      print('exception');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: size6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: size8,
            ),
            child: Text(
              widget.sectionTitle,
              style: sectionTitleStyle,
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
          ),
          MoviesScrollView(
            movieTiles: moviesList,
          ),
        ],
      ),
    );
  }
}
