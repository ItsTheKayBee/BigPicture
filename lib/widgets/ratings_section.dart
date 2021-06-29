import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/preview.dart';
import 'package:flutter/material.dart';

class RatingsSection extends StatelessWidget {
  RatingsSection({this.scale = 1, required this.ratings});

  final double scale;
  final List<Rating> ratings;

  @override
  Widget build(BuildContext context) {
    Rating missingRating = Rating(source: '', value: '-');
    List<Rating> modifiedRatings = [
      missingRating,
      missingRating,
      missingRating
    ];
    // bool noRatings = true;
    for (Rating rating in ratings) {
      if (rating.source == 'Internet Movie Database') {
        modifiedRatings[0] = rating;
        // noRatings = false;
      }
      if (rating.source == 'Rotten Tomatoes') {
        modifiedRatings[1] = rating;
        // noRatings = false;
      }
      if (rating.source == 'Metacritic') {
        modifiedRatings[2] = rating;
        // noRatings = false;
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (modifiedRatings[0].value != '-')
          Container(
            child: Row(
              children: [
                Transform.scale(
                  scale: scale,
                  child: Image.asset(
                    'assets/imdb.png',
                  ),
                ),
                SizedBox(
                  width: size3,
                ),
                Text(
                  modifiedRatings[0].value.split('/')[0],
                  style: moviePreviewRatings,
                )
              ],
            ),
          ),
        if (modifiedRatings[1].value != '-')
          Container(
            child: Row(
              children: [
                Image.asset(
                  'assets/tomato.png',
                  height: 25,
                ),
                SizedBox(
                  width: size3,
                ),
                Text(
                  modifiedRatings[1].value,
                  style: moviePreviewRatings,
                )
              ],
            ),
          ),
        if (modifiedRatings[2].value != '-')
          Container(
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(size1),
            ),
            padding: EdgeInsets.symmetric(horizontal: size2),
            child: Center(
              child: Text(
                modifiedRatings[2].value.split('/')[0],
                style: moviePreviewMetacritic,
              ),
            ),
          ),
      ],
    );
  }
}
