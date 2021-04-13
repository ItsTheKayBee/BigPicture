import 'package:flutter/material.dart';

class GenreLabel extends StatelessWidget {
  final String genreText;
  final Color bgColor;
  final Color textColor;

  const GenreLabel({
    required this.genreText,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: bgColor,
      ),
      child: Text(
        '$genreText',
        style: TextStyle(color: textColor),
      ),
    );
  }
}
