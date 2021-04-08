import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/widgets/movies_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: size8 + size2,
              left: size8,
              right: size8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.explore,
                    size: size2 * 7,
                    color: Color(0x8f163e57),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size4,
                    bottom: size4,
                  ),
                  child: Text(
                    homeTitle,
                    style: headingStyle,
                  ),
                ),
              ],
            ),
          ),
          MoviesSection(
            sectionTitle: newMovies,
          ),
          MoviesSection(
            sectionTitle: popularMovies,
          ),
          MoviesSection(
            sectionTitle: popularTvShows,
          ),
          MoviesSection(
            sectionTitle: recommendations,
          ),
        ],
      ),
      // decoration: gradientBackdrop,
    );
  }
}
