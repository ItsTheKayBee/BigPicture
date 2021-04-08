import 'package:big_picture/constants/strings.dart';
import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/screens/home_screen.dart';
import 'package:big_picture/screens/user_profile_screen.dart';
import 'package:big_picture/screens/watch_history_screen.dart';
import 'package:big_picture/screens/watch_list_screen.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';

class CurrentScreen extends StatefulWidget {
  @override
  _CurrentScreenState createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {
  int _index = 0;

  List<Map<String, dynamic>> pages = [
    {
      'title': homeTitle,
      'view': HomeScreen(),
    },
    {
      'title': watchListTitle,
      'view': WatchListScreen(),
    },
    {
      'title': watchHistoryTitle,
      'view': WatchHistoryScreen(),
    },
    {
      'title': userProfileTitle,
      'view': UserProfileScreen(),
    },
  ];

  void onChangedTab(int index) {
    setState(() {
      this._index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavBar(
        navBarIndex: _index,
        onChangedTab: onChangedTab,
      ),
      body: Container(
        child: pages[_index]['view'],
        decoration: gradientBackdrop,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        foregroundColor: Colors.white,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
