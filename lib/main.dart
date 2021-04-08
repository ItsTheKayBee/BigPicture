import 'package:big_picture/widgets/current_screen.dart';
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
