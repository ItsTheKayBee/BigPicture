import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTilesModel.dart';
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
            movieListType: Explore.nowPlaying,
          ),
          MoviesSection(
            sectionTitle: newMoviesInRegion,
            movieListType: Explore.newInRegion,
          ),
          MoviesSection(
            sectionTitle: popularMovies,
            movieListType: Explore.popular,
          ),
          MoviesSection(
            sectionTitle: popularMoviesInRegion,
            movieListType: Explore.popularInRegion,
          ),
          MoviesSection(
            sectionTitle: popularTvShows,
            movieListType: Explore.popularTv,
          ),
          MoviesSection(
            sectionTitle: airingNowTv,
            movieListType: Explore.airingNowTv,
          ),
          MoviesSection(
            sectionTitle: recommendations,
            movieListType: Explore.recommendations,
          ),
          MoviesSection(
            sectionTitle: upcoming,
            movieListType: Explore.upcoming,
          ),
          MoviesSection(
            sectionTitle: upcomingInRegion,
            movieListType: Explore.upcomingInRegion,
          ),
        ],
      ),
    );
  }
}
