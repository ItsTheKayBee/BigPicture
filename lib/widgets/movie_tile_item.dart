import 'package:big_picture/widgets/movie_preview.dart';
import 'package:flutter/material.dart';

import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieTileItem extends StatelessWidget {
  // condition to check whether current card is the focussed card
  final MovieTile movieTile;
  final int index;
  final int currentIndex;
  late Size size;

  MovieTileItem({
    required this.movieTile, // data model
    this.index = 0, // state index of this item
    this.currentIndex = 0, // index of focussed item
  });

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final bool _isFocussed = index == currentIndex;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return MoviePreview(
              tmdbID: movieTile.movieId,
              imageUrl: movieTile.imageUrl,
              isImageValid: movieTile.isImageValid,
            );
          },
        );
      },
      child: AnimatedContainer(
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 2000),
        width: size.width * 0.6,
        padding: EdgeInsets.only(right: 16),
        child: Transform.scale(
          alignment: Alignment.topCenter,
          scale: _isFocussed
              ? 1.0
              : 0.9, // changes size based on the focussed prop
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: _isFocussed
                    ? cardElevation
                    : 0.0, // changes elevation bases on focussed prop
                shadowColor: primaryColor,

                child: movieTile.isImageValid
                    ? CachedNetworkImage(
                        imageUrl: movieTile.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (ctx, url) => Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/image.png',
                          ), //placeholder will be shown while image is loading
                        ),
                      )
                    : Image.asset('assets/image.png'),
              ),
              Padding(
                padding: EdgeInsets.only(left: size1),
                child: Text(
                  movieTile.movieName,
                  style: titleStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size1),
                child: Text(
                  '${movieTile.voteAverage}/10',
                  style: subTitleStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
