import 'package:big_picture/screens/home.dart';
import 'package:flutter/material.dart';

import './constants/styles.dart';
import './constants/strings.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            elevation: cardElevation,
            notchMargin: size2,
            shape: CircularNotchedRectangle(),
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.home_outlined),
                    onPressed: () {},
                    color: fontColorLight,
                    iconSize: size8,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.bookmark_outline),
                    onPressed: () {},
                    color: fontColorLight,
                    iconSize: size8,
                  ),
                ),
                Spacer(),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.check_circle_outline),
                    onPressed: () {},
                    color: fontColorLight,
                    iconSize: size8,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.person_outline),
                    onPressed: () {},
                    color: fontColorLight,
                    iconSize: size8,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.search),
            foregroundColor: Colors.white,
            onPressed: () {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
