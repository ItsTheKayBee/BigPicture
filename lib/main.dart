import 'package:big_picture/widgets/current_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './constants/styles.dart';
import './constants/strings.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: appName,
      theme: themeData,
      home: SafeArea(
        child: CurrentScreen(),
      ),
    );
  }
}
