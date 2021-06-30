import 'package:flutter/material.dart';

import '../constants/styles.dart';
import '../constants/content_type.dart';

class ChoiceChipGroup extends StatelessWidget {
  final selectedType;
  final void Function(dynamic) onSelected;

  ChoiceChipGroup({
    required this.onSelected,
    required this.selectedType,
  });

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
            index: Type.movie,
            onSelected: onSelected,
            selectedIndex: selectedType,
          ),
          SearchChoiceChip(
            labelText: 'TV Series',
            iconData: Icons.videocam_outlined,
            selectedIconData: Icons.videocam,
            index: Type.tv,
            onSelected: onSelected,
            selectedIndex: selectedType,
          ),
          SearchChoiceChip(
            labelText: 'People',
            iconData: Icons.face_outlined,
            selectedIconData: Icons.face,
            index: Type.people,
            onSelected: onSelected,
            selectedIndex: selectedType,
          ),
        ],
      ),
    );
  }
}

class SearchChoiceChip extends StatelessWidget {
  final String labelText;
  final IconData iconData;
  final IconData selectedIconData;
  final index;
  final Function onSelected;
  final selectedIndex;

  SearchChoiceChip({
    required this.labelText,
    required this.iconData,
    required this.selectedIconData,
    required this.index,
    required this.onSelected,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;

    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: Container(
          child: isSelected ? Text(labelText) : Text(''),
        ),
        avatar: Icon(
          isSelected ? selectedIconData : iconData,
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
          if (selected) onSelected(index);
        },
      ),
    );
  }
}
