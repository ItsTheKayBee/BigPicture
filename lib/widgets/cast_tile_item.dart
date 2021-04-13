import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:flutter/material.dart';

class CastTileItem extends StatelessWidget {
  final MovieTile movieTile;

  CastTileItem({
    required this.movieTile, // data model
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('hello');
      },
      child: Container(
        width: 160,
        height: 250,
        padding: EdgeInsets.only(right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Image.asset(
                movieTile.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size1),
              child: Text(
                movieTile.movieName,
                style: movieDetailsCastName,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size1),
              child: Text(
                movieTile.movieGenres,
                style: movieDetailsCastScreenName,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
