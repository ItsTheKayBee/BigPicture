import 'package:big_picture/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavBar extends StatefulWidget {
  final ValueChanged<int> onChangeTab;
  BottomNavBar({this.onChangeTab});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: size3,
            blurRadius: size4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: fontColorDark,
        height: 60,
        animationCurve: Curves.easeIn,
        items: <Widget>[
          navItem(
            index: 0,
            iconData: Icons.explore_outlined,
            selectedColor: greenIconColor,
          ),
          navItem(
            index: 1,
            iconData: Icons.favorite_outline,
            selectedColor: redIconColor,
          ),
          navItem(
            index: 2,
            iconData: Icons.search_outlined,
            selectedColor: yellowIconColor,
          ),
          navItem(
            index: 3,
            iconData: Icons.verified_outlined,
            selectedColor: blueIconColor,
          ),
          navItem(
            index: 4,
            iconData: Icons.insights_outlined,
            selectedColor: purpleIconColor,
          ),
        ],
        onTap: (int index) {
          widget.onChangeTab(index);
          setState(
            () => _currentIndex = index,
          );
        },
      ),
    );
  }

  Widget navItem({int index, IconData iconData, Color selectedColor}) {
    return Padding(
      padding: EdgeInsets.all(size1),
      child: Icon(
        iconData,
        size: size8,
        color: _currentIndex == index ? selectedColor : fontColorDark,
      ),
    );
  }
}
