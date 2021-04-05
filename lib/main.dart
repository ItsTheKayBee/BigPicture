import 'package:flutter/material.dart';

import './constants/styles.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Big Picture',
      theme: ThemeData(
        //colors
        accentColor: Color(0xff70bba3),
        primaryColor: Color(0xffc4dbd8),

        //font
        fontFamily: 'Poppins',
      ),
      home: SafeArea(
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var gradientBackdrop = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Theme.of(context).primaryColor,
          Color(0xffe0eceb),
          Colors.white,
        ],
      ),
    );

    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Expanded(
              child: Container(
                height: 300,
                child: Column(
                  children: [
                    Text("New Movies"),
                    ListView(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                color: Colors.black,
                                height: 250,
                              ),
                              Text("Wonder Woman"),
                              Text("Action, Adventure"),
                            ],
                          ),
                        )
                      ],
                      scrollDirection: Axis.horizontal,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        decoration: gradientBackdrop,
      ),
    );
  }
}
