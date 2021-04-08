import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:flutter/material.dart';

import 'movies_grid_view.dart';

class MoviesListLayout extends StatelessWidget {
  const MoviesListLayout({
    @required this.headingIcon,
    @required this.headingTitle,
    @required this.movieTiles,
  });

  final IconData headingIcon;
  final String headingTitle;
  final List<MovieTile> movieTiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: size8 + size2,
              left: size8,
              right: size8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  headingIcon,
                  size: size2 * 7,
                  color: Color(0x8f163e57),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size4,
                    bottom: size4,
                  ),
                  child: Text(
                    headingTitle,
                    style: headingStyle,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: TextFormField(
                        style: titleStyle,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: fontColorDark,
                            size: size6,
                          ),
                          hintText: searchText,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: IconButton(
                          icon: Icon(
                            Icons.tune_outlined,
                            color: fontColorDark,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: size4,
          ),
          Expanded(
            child: MoviesGridView(movieTiles: movieTiles),
          ),
        ],
      ),
    );
  }
}