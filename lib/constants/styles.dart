import 'package:flutter/material.dart';

// GLobal Theme
ThemeData themeData = ThemeData(
  accentColor: accentColor,
  //colors scheme
  primarySwatch: primarySwatch,

  // Custom text selection colors
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: fontColorDark,
    selectionColor: primaryColor,
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
const Color primaryColor = Color(0xffafcdc9);
const Color accentColor = Color(0xff70bba3);
const Color secondaryColor = Color(0xff8db3ae);

const Color unfocussedColor = Color(0xaf8db3ae);
const Color transparentColor = Color(0x00000000);

const Color fontColorDark = Color(0xff163e57);
const Color fontColorLight = Color(0xff6c8594);

const Color textFieldFilledColor = Color(0x55ffffff);
const Color searchTextFieldColor = Color(0xffe7ecf2);

// nav bar icon color
Color yellowIconColor = Colors.amberAccent.shade200;
Color greenIconColor = Colors.greenAccent.shade200;
Color blueIconColor = Colors.lightBlueAccent.shade200;
Color redIconColor = Colors.redAccent.shade200;
Color purpleIconColor = Colors.pinkAccent.shade100;

MaterialColor primarySwatch = MaterialColor(
  0xFFAFCDC9,
  <int, Color>{
    50: Color(0xFFF5F9F9),
    100: Color(0xFFE7F0EF),
    200: Color(0xFFD7E6E4),
    300: Color(0xFFC7DCD9),
    400: Color(0xFFBBD5D1),
    500: Color(0xFFAFCDC9),
    600: Color(0xFFA8C8C3),
    700: Color(0xFF9FC1BC),
    800: Color(0xFF96BAB5),
    900: Color(0xFF86AEA9),
  },
);

//styles
//
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

// background color
const BoxDecoration gradientBackdrop = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primaryColor,
      Color(0xFFE7F0EF),
      Color(0xffeaf2ef),
      Color(0xFFF5F9F9),
    ],
  ),
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(size4),
  borderSide: BorderSide(style: BorderStyle.none),
);

//sizes
const double movieCardHeight = size8 * 10;
const double borderRadius = size6;
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
