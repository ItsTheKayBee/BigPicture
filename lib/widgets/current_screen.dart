import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/screens/home_screen.dart';
import 'package:big_picture/screens/insights_screen.dart';
import 'package:big_picture/screens/search_screen.dart';
import 'package:big_picture/screens/test.dart';
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

  List<Widget> pages = [
    HomeScreen(),
    WatchListScreen(),
    SearchScreen(),
    WatchHistoryScreen(),
    InsightsScreen(),
  ];

  void onChangeTab(int index) {
    setState(() {
      this._index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // required for transparent curve in bottom bar
      resizeToAvoidBottomInset:
          false, // to not add padding at the bottom when keybaord opens
      bottomNavigationBar: BottomNavBar(
        onChangeTab:
            onChangeTab, // call back which gets called when tab changes
      ),
      // change screen according to selected nav item
      body: Container(
        child: pages[_index],
        color: Colors.white,
      ),
    );
  }
}
