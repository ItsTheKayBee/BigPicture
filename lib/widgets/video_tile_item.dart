import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:flutter/material.dart';

class CastTileItem extends StatelessWidget {
  final MovieTile movieTile;

  CastTileItem({
    @required this.movieTile, // data model
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 250,
        height: 140,
        padding: EdgeInsets.only(right: 8),
        child: Card(
          child: Image.asset(
            movieTile.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
