import 'package:flutter/material.dart';

import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/utilities/marquee.dart';

Widget movieTileItem({
  @required MovieTile movieTile, // data model
  int index = 0, // state index of this item
  int currentIndex = 0, // index of focussed item
}) {
  // condition to check whether current card is the focussed card
  final bool _isFocussed = index == currentIndex;

  return Container(
    child: Transform.scale(
      scale:
          _isFocussed ? 1.0 : 0.75, // changes size based on the focussed prop
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: _isFocussed
                ? cardElevation
                : 0.0, // changes elevation bases on focussed prop
            shadowColor: primaryColor,
            child: Image.asset(
              movieTile.imageUrl,
              fit: BoxFit.fill,
              colorBlendMode: BlendMode.lighten,
              color: _isFocussed
                  ? transparentColor
                  : unfocussedColor, // changes color overlay based on focussed prop
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size1),
            child: MarqueeWidget(
              // shows marquee text if text overflows
              child: Text(
                movieTile.movieName,
                style: titleStyle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size1),
            child: MarqueeWidget(
              // shows marquee text if text overflows
              child: Text(
                movieTile.movieGenres,
                style: subTitleStyle,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
