import 'package:big_picture/widgets/filter_modal.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../constants/styles.dart';
import '../constants/content_type.dart';
import '../models/searchModel.dart';
import 'choice_chip_group.dart';
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
  var selectedType = Type.movie;

  Future<List> updateSearchResults() async {
    String query = searchQuery.trim();
    if (query == '') {
      return [];
    }
    return searchModel.getSearchResults(
      query: query,
      contentType: selectedType,
    );
  }

  void onSearch(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  void setSelected(selectedType) {
    setState(() {
      this.selectedType = selectedType;
    });
    onSearch(searchQuery);
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
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            enableDrag: false,
                            backgroundColor: Colors.transparent,
                            builder: (ctx) {
                              return FilterModal();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              if (widget.isChoiceChipGroupPresent)
                ChoiceChipGroup(
                  selectedType: selectedType,
                  onSelected: setSelected,
                ),
            ],
          ),
          SizedBox(height: size4),
          Flexible(
            child: MoviesGridView(
              items: updateSearchResults(),
              contentType: selectedType,
            ),
          ),
        ],
      ),
    );
  }
}
