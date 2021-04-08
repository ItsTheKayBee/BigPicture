import 'package:flutter/material.dart';

//colors
const Color unfocussedColor = Color(0xaf8db3ae);
const Color transparentColor = Color(0x00000000);
const Color primaryColor = Color(0xffafcdc9);
const Color accentColor = Color(0xff70bba3);
const Color secondaryColor = Color(0xff8db3ae);
const Color fontColorDark = Color(0xff163e57);
const Color fontColorLight = Color(0xff6c8594);

//styles
const TextStyle headingFont = TextStyle(
  color: fontColorDark,
  fontSize: size5,
  fontWeight: FontWeight.bold,
);

const TextStyle movieFont = TextStyle(
  color: fontColorDark,
  fontSize: size3 + 2,
  fontWeight: FontWeight.w500,
);

const TextStyle genreFont = TextStyle(
  color: fontColorLight,
  fontSize: size3,
  fontWeight: FontWeight.w300,
);

const BoxDecoration gradientBackdrop = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primaryColor,
      Color(0xffeaf2ef),
      Color(0xfff5f9f8),
    ],
  ),
);

//sizes
const double movieCardHeight = size8 * 10;
const double borderRadius = size4;
const double cardElevation = size2;

// generic sizes
const double size1 = 4.0;
const double size2 = 8.0;
const double size3 = 12.0;
const double size4 = 16.0;
const double size5 = 20.0;
const double size6 = 24.0;
const double size7 = 28.0;
const double size8 = 32.0;
