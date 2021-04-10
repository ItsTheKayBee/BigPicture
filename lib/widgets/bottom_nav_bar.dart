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
      child: CurvedNavigationBar(
        backgroundColor: transparentColor,
        buttonBackgroundColor: fontColorDark,
        height: 60,
        animationCurve: Curves.easeIn,
        items: <Widget>[
          Padding(
            padding: EdgeInsets.all(size1), // padding to increase button size
            child: Icon(
              Icons.explore_outlined,
              size: size8,
              color: _currentIndex == 0
                  ? accentColor
                  : fontColorDark, // changes color based on selected
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size1),
            child: Icon(
              Icons.favorite_border_outlined,
              size: size8,
              color: _currentIndex == 1 ? accentColor : fontColorDark,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size1),
            child: Icon(
              Icons.search_outlined,
              size: size8,
              color: _currentIndex == 2 ? accentColor : fontColorDark,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size1),
            child: Icon(
              Icons.verified_outlined,
              size: size8,
              color: _currentIndex == 3 ? accentColor : fontColorDark,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size1),
            child: Icon(
              Icons.insights_outlined,
              size: size8,
              color: _currentIndex == 4 ? accentColor : fontColorDark,
            ),
          ),
        ],
        onTap: (int index) {
          widget.onChangeTab(index);
          Future.delayed(Duration(milliseconds: 400), () {
            setState(
              () => _currentIndex = index,
            );
          });
        },
      ),
    );
  }
}
