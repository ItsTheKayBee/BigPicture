import 'dart:math';

import 'package:flutter/material.dart';

//colors
const Color unfocussedColor = Color(0xa0afcdc9);
const Color transparentColor = Color(0x00000000);
const Color primaryColor = Color(0xffafcdc9);
const Color accentColor = Color(0xff70bba3);
const Color secondaryColor = Color(0xff8db3ae);
const Color fontColorDark = Color(0xff163e57);
const Color fontColorLight = Color(0xff6c8594);

//styles
const headingFont = TextStyle(
  color: fontColorDark,
  fontSize: size6,
  fontWeight: FontWeight.bold,
);

const movieFont = TextStyle(
  color: fontColorDark,
  fontSize: size4 + 2,
  fontWeight: FontWeight.w400,
);

const genreFont = TextStyle(
  color: fontColorLight,
  fontSize: size4,
  fontWeight: FontWeight.w400,
);

const gradientBackdrop = BoxDecoration(
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
const movieCardHeight = 320.0;
const movieCardWidth = 180.0;
const borderRadius = 24.0;
const cardElevation = 40.0;

// generic sizes
const size1 = 4.0;
const size2 = 8.0;
const size3 = 12.0;
const size4 = 16.0;
const size5 = 20.0;
const size6 = 24.0;
const size7 = 28.0;
const size8 = 32.0;
