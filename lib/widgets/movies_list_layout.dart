import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'choice_chip_group.dart';
import 'package:flutter/material.dart';
import 'default_header.dart';
import 'movies_grid_view.dart';

class MoviesListLayout extends StatelessWidget {
  MoviesListLayout({
    required this.headingIcon,
    required this.headingTitle,
    required this.movieTiles,
    this.isChoiceChipGroupPresent = false,
  });

  final IconData headingIcon;
  final String headingTitle;
  final List<MovieTile> movieTiles;
  final bool isChoiceChipGroupPresent;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: headerPadding,
            child: Column(
              children: [
                DefaultHeader(
                  headingIcon: headingIcon,
                  headingTitle: headingTitle,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: TextFormField(
                        style: titleStyle,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: fontColorDark,
                            size: size6,
                          ),
                          hintText: searchText,
                          contentPadding: EdgeInsets.all(size3),
                        ),
                      ),
                    ),
                    Flexible(
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
                isChoiceChipGroupPresent ? ChoiceChipGroup() : Container(),
              ],
            ),
          ),
          SizedBox(
            height: size4,
          ),
          Flexible(child: MoviesGridView(movieTiles: movieTiles)),
        ],
      ),
    );
  }
}
