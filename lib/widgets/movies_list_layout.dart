import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:big_picture/models/searchModel.dart';
import 'choice_chip_group.dart';
import 'package:flutter/material.dart';
import 'default_header.dart';
import 'movies_grid_view.dart';

class MoviesListLayout extends StatefulWidget {
  MoviesListLayout({
    required this.headingIcon,
    required this.headingTitle,
    this.isChoiceChipGroupPresent = false,
  });

  final IconData headingIcon;
  final String headingTitle;
  final bool isChoiceChipGroupPresent;

  @override
  _MoviesListLayoutState createState() => _MoviesListLayoutState();
}

class _MoviesListLayoutState extends State<MoviesListLayout> {
  SearchModel searchModel = SearchModel();
  String searchQuery = '';

  Future<List<MovieTile>> updateSearchResults() {
    return searchModel.getSearchResults(query: searchQuery);
  }

  void onSearch(String query) {
    setState(() {
      searchQuery = query;
      updateSearchResults();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              DefaultHeader(
                headingIcon: widget.headingIcon,
                headingTitle: widget.headingTitle,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: TextFormField(
                      style: titleStyle,
                      onFieldSubmitted: onSearch,
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
              if (widget.isChoiceChipGroupPresent) ChoiceChipGroup(),
            ],
          ),
          SizedBox(height: size4),
          Flexible(child: MoviesGridView(movieTiles: updateSearchResults())),
        ],
      ),
    );
  }
}
