import 'package:big_picture/screens/home_screen.dart';
import 'package:big_picture/screens/user_profile_screen.dart';
import 'package:big_picture/screens/watch_history_screen.dart';
import 'package:big_picture/screens/watch_list_screen.dart';
import 'package:big_picture/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './constants/styles.dart';
import './constants/strings.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: secondaryColor,
    ));

    return MaterialApp(
      title: appName,
      theme: ThemeData(
        //colors
        accentColor: accentColor,

        primaryColor: primaryColor,

        //font
        fontFamily: 'Poppins',

        //card theme
        cardTheme: CardTheme(
          clipBehavior: Clip.hardEdge,
          elevation: cardElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      home: SafeArea(
        child: CurrentScreen(),
      ),
    );
  }
}

class CurrentScreen extends StatefulWidget {
  @override
  _CurrentScreenState createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {
  int _index = 0;

  List<Widget> pages = [
    HomeScreen(),
    WatchListScreen(),
    WatchHistoryScreen(),
    UserProfileScreen(),
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
      bottomNavigationBar: BottomNavBar(
        navBarIndex: _index,
        onChangedTab: onChangedTab,
      ),
      body: pages[_index],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        foregroundColor: Colors.white,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
