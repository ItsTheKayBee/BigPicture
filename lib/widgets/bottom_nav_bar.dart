import 'package:big_picture/constants/styles.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int navBarIndex;
  final ValueChanged<int> onChangedTab;
  BottomNavBar({this.navBarIndex, this.onChangedTab});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: cardElevation,
      shape: CircularNotchedRectangle(),
      notchMargin: size2,
      child: Row(
        children: [
          navBarItem(
            index: 0,
            iconData: Icons.home_outlined,
          ),
          navBarItem(
            index: 1,
            iconData: Icons.bookmark_outline,
          ),
          Spacer(),
          navBarItem(
            index: 2,
            iconData: Icons.check_circle_outline,
          ),
          navBarItem(
            index: 3,
            iconData: Icons.person_outline,
          ),
        ],
      ),
    );
  }

  Widget navBarItem({
    @required int index,
    @required IconData iconData,
  }) {
    final bool isSelected = index == navBarIndex;

    return Expanded(
      child: IconButton(
        icon: Icon(iconData),
        onPressed: () => onChangedTab(index),
        color: isSelected ? fontColorDark : fontColorLight,
        iconSize: size7,
      ),
    );
  }
}
