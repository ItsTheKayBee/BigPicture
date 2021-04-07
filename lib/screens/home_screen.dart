import 'package:big_picture/constants/styles.dart';
import 'package:big_picture/widgets/movies_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            MoviesSection(),
            MoviesSection(),
            MoviesSection(),
          ],
        ),
        decoration: gradientBackdrop,
      ),
    );
  }
}