import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/models/movieTilesModel.dart';
import 'package:flutter/material.dart';

import './constants/styles.dart';
import './constants/strings.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Big Picture',
      theme: ThemeData(
        //colors
        accentColor: Color(0xff8cb4af),
        primaryColor: Color(0xffafcdc9),

        //font
        fontFamily: 'Poppins',

        //card theme
        cardTheme: CardTheme(
          clipBehavior: Clip.hardEdge,
          elevation: cardElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      home: SafeArea(
        child: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<MovieTile> _movieTiles = MovieTilesModel().allMovieTiles;

  @override
  Widget build(BuildContext context) {
    int _focusedIndex = 0;

    var _gradientBackdrop = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Theme.of(context).primaryColor,
          Color(0xffeaf2ef),
          Color(0xfff5f9f8),
        ],
      ),
    );

    void _onItemFocus(int index) {
      setState(() {
        _focusedIndex = index;

        _movieTiles[index].focussed = true;

        if (index != 0) _movieTiles[index - 1].focussed = false;
        if (index != _movieTiles.length - 1)
          _movieTiles[index + 1].focussed = false;
      });
    }

    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: size4,
                    left: size4,
                  ),
                  child: Text(
                    newMovies,
                    style: headingFont,
                  ),
                ),
                Container(
                  height: movieCardHeight,
                  child: ScrollSnapList(
                    onItemFocus: _onItemFocus,
                    itemSize: movieCardWidth,
                    itemBuilder: (context, index) => MovieTileItem(
                      movieTile: _movieTiles[index],
                    ),
                    itemCount: _movieTiles.length,
                    dynamicItemSize: true,
                    initialIndex: -1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: _gradientBackdrop,
      ),
    );
  }
}

class MovieTileItem extends StatelessWidget {
  final MovieTile movieTile;

  MovieTileItem({
    this.movieTile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: movieCardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Card(
              child: Image.asset(
                movieTile.imageUrl,
                fit: BoxFit.fill,
                color: movieTile.focussed ? transparentColor : unfocussedColor,
                colorBlendMode: BlendMode.lighten,
              ),
            ),
          ),
          SizedBox(height: size2),
          Padding(
            padding: EdgeInsets.only(left: size1),
            child: Text(
              movieTile.movieName,
              style: movieFont,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size1),
            child: Text(
              movieTile.movieGenres,
              style: genreFont,
            ),
          ),
        ],
      ),
    );
  }
}
