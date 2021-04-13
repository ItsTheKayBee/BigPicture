import 'package:big_picture/constants/styles.dart';
import 'package:flutter/material.dart';

class RatingsSection extends StatelessWidget {
  RatingsSection({this.scale = 1});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
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
                '8.5',
                style: moviePreviewRatings,
              )
            ],
          ),
        ),
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
                '85%',
                style: moviePreviewRatings,
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.circular(size1),
          ),
          padding: EdgeInsets.symmetric(horizontal: size2),
          child: Center(
            child: Text(
              '89',
              style: moviePreviewMetacritic,
            ),
          ),
        ),
      ],
    );
  }
}
