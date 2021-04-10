import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/models/movieTile.dart';
import 'package:flutter/material.dart';
import 'default_header.dart';
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
                ChoiceChipGroup(),
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

class ChoiceChipGroup extends StatefulWidget {
  @override
  _ChoiceChipGroupState createState() => _ChoiceChipGroupState();
}

class _ChoiceChipGroupState extends State<ChoiceChipGroup> {
  int selectedIndex = 0;

  void onSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchChoiceChip(
            labelText: 'Movies',
            iconData: Icons.movie_creation_outlined,
            selectedIconData: Icons.movie_creation,
            index: 0,
            onSelected: onSelected,
            selectedIndex: selectedIndex,
          ),
          SearchChoiceChip(
            labelText: 'Actors',
            iconData: Icons.face_outlined,
            selectedIconData: Icons.face,
            index: 1,
            onSelected: onSelected,
            selectedIndex: selectedIndex,
          ),
          SearchChoiceChip(
            labelText: 'Directors',
            iconData: Icons.videocam_outlined,
            selectedIconData: Icons.videocam,
            index: 2,
            onSelected: onSelected,
            selectedIndex: selectedIndex,
          ),
        ],
      ),
    );
  }
}

class SearchChoiceChip extends StatefulWidget {
  final String labelText;
  final IconData iconData;
  final IconData selectedIconData;
  final int index;
  final Function onSelected;
  final int selectedIndex;

  SearchChoiceChip({
    @required this.labelText,
    @required this.iconData,
    @required this.selectedIconData,
    @required this.index,
    @required this.onSelected,
    @required this.selectedIndex,
  });

  @override
  _SearchChoiceChipState createState() => _SearchChoiceChipState();
}

class _SearchChoiceChipState extends State<SearchChoiceChip> {
  @override
  Widget build(BuildContext context) {
    final bool isSelected = widget.selectedIndex == widget.index;

    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: Container(
          child: isSelected ? Text(widget.labelText) : Text(''),
        ),
        avatar: Icon(
          isSelected ? widget.selectedIconData : widget.iconData,
          color: isSelected ? fontColorDark : fontColorLight,
          size: size6 + 2,
        ),
        selected: isSelected,
        labelStyle: labelTextStyle,
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        backgroundColor: Colors.transparent,
        pressElevation: 0,
        selectedColor: Colors.amber.shade200,
        onSelected: (selected) {
          if (selected) widget.onSelected(widget.index);
        },
      ),
    );
  }
}
