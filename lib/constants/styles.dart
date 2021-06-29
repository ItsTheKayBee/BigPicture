import 'package:flutter/material.dart';

// GLobal Theme
ThemeData themeData = ThemeData(
  accentColor: accentColor,
  //colors scheme
  primarySwatch: Colors.grey,

  // Custom text selection colors
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: fontColorDark,
    // selectionColor: primaryColor,
    selectionHandleColor: fontColorDark,
  ),

  // Custom text field theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: textFieldFilledColor,
    hintStyle: hintTextStyle,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    isDense: true,
  ),
  //font
  fontFamily: 'Poppins',

  //card theme
  cardTheme: CardTheme(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
  ),
);

//colors
const Color primaryColor = Color(0xff278ea5);
const Color accentColor = Color(0xff21e6c1);

const Color unfocussedColor = Color(0xaf8db3ae);

const Color fontColorDark = primaryColor;
const Color fontColorLight = Color(0xff6c8594);

const Color textFieldFilledColor = Color(0x55ffffff);

//pastel shades
const Color blueCustomViewColor = Color(0xff4fa9fb);
const Color redCustomViewColor = Color(0xfff67280);
const Color greenCustomViewColor = Color(0xff9fdfcd);

// nav bar icon color
Color yellowIconColor = Colors.amberAccent.shade200;
Color greenIconColor = Colors.greenAccent.shade200;
Color blueIconColor = Colors.lightBlueAccent.shade200;
Color redIconColor = Colors.redAccent.shade200;
Color purpleIconColor = Colors.pinkAccent.shade100;

///styles
// text styles
// section titles text ex. recommendations, new releases, etc
const TextStyle sectionTitleStyle = TextStyle(
  color: fontColorDark,
  fontSize: size5,
  fontWeight: FontWeight.w600,
);

// heading text font ex. screen titles
const TextStyle headingStyle = TextStyle(
  color: fontColorDark,
  fontSize: size6,
  fontWeight: FontWeight.w600,
);

// title text font ex. name
const TextStyle titleStyle = TextStyle(
  color: fontColorDark,
  fontSize: size3 + 2,
  fontWeight: FontWeight.w500,
);

// subtitle text font ex. genre
const TextStyle subTitleStyle = TextStyle(
  color: fontColorLight,
  fontSize: size3,
  fontWeight: FontWeight.w300,
);

// hint text font
const TextStyle hintTextStyle = TextStyle(
  color: fontColorLight,
  fontSize: size4,
  fontWeight: FontWeight.w400,
);

// lavel text font
const TextStyle labelTextStyle = TextStyle(
  color: fontColorDark,
  fontSize: size4 + 2,
  fontWeight: FontWeight.w400,
);

// title for movie preview screen
const TextStyle moviePreviewTitle = TextStyle(
  color: Colors.black,
  fontSize: size4 + 2,
  fontWeight: FontWeight.w500,
  height: 1.1,
);

// year, time and genre for moview preview screen
TextStyle moviePreviewSubTitle = TextStyle(
  color: Colors.grey.shade700,
  fontSize: size2 + 2,
  fontWeight: FontWeight.w300,
);

// short description for movie preview
TextStyle moviePreviewDescription = TextStyle(
  color: Colors.grey.shade900,
  fontSize: size3,
  fontWeight: FontWeight.w400,
);

// imdb and rotten tomato text
const TextStyle moviePreviewRatings = TextStyle(
  color: Colors.black,
  fontSize: size4 + 2,
  fontWeight: FontWeight.w400,
);

// metacritic ratings text
const TextStyle moviePreviewMetacritic = TextStyle(
  color: Colors.white70,
  fontSize: size4 + 2,
  fontWeight: FontWeight.w500,
);

const TextStyle movieDetailsTitle = TextStyle(
  color: Colors.black,
  fontSize: size6,
  height: 1.15,
  fontWeight: FontWeight.w600,
);

TextStyle movieDetailsDescription = TextStyle(
  color: Colors.grey.shade500,
  fontSize: size3 + 2,
  fontWeight: FontWeight.w300,
  height: 1.25,
);

TextStyle movieDetailsTagline = TextStyle(
  color: Colors.grey.shade500,
  fontSize: size3 + 2,
  fontWeight: FontWeight.w300,
  height: 1.25,
  fontStyle: FontStyle.italic,
);

TextStyle movieDetailsData = TextStyle(
  color: Colors.grey.shade800,
  fontSize: size4,
  fontWeight: FontWeight.w400,
);

TextStyle movieDetailsSectionTitle = TextStyle(
  color: Colors.white,
  fontSize: size5,
  fontWeight: FontWeight.w500,
);

TextStyle movieDetailsCastName = TextStyle(
  color: Colors.white70,
  fontSize: size3 + 2,
  fontWeight: FontWeight.w500,
);

TextStyle movieDetailsCastScreenName = TextStyle(
  color: Colors.white60,
  fontSize: size3,
  fontWeight: FontWeight.w400,
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(size4),
  borderSide: BorderSide(style: BorderStyle.none),
);

//sizes
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
