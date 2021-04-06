import 'package:big_picture/screens/home.dart';
import 'package:big_picture/widgets/bottom_nav_bar.dart';
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
        child: BottomNavBar(),
      ),
    );
  }
}
