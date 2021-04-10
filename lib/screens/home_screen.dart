import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/widgets/default_header.dart';
import 'package:big_picture/widgets/movies_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: headerPadding,
            child: DefaultHeader(
              headingIcon: Icons.explore,
              headingTitle: homeTitle,
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
