import 'package:flutter/material.dart';
import 'package:pots_trackr/ui/shared/app_colors.dart';

// Box Decorations

BoxDecoration fieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[200]);

BoxDecoration disabledFieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[100]);

// Field Variables

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = const EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    const EdgeInsets.symmetric(horizontal: 15, vertical: 15);

// Text Variables
const String fontName = 'Roboto';

const TextStyle buttonTitleTextStyle =
    const TextStyle(fontWeight: FontWeight.w700, color: Colors.white);

// Theme Data

ThemeData appTheme = ThemeData(
  backgroundColor: LightColor.background,
  primaryColor: LightColor.purple,
  cardTheme: CardTheme(color: LightColor.background),
  textTheme: TextTheme(headline4: TextStyle(color: LightColor.black)),
  iconTheme: IconThemeData(color: LightColor.iconColor),
  dividerColor: LightColor.grey,
  primaryTextTheme: TextTheme(
    bodyText1: TextStyle(color: LightColor.titleTextColor),
  ),
);

const TextTheme textTheme = TextTheme(
  headline4: display1,
  headline5: headline,
  headline6: title,
  subtitle2: subtitle,
  bodyText1: body2,
  bodyText2: body1,
  caption: caption,
);

const TextStyle display1 = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.bold,
  fontSize: 36,
  letterSpacing: 0.4,
  height: 0.9,
  color: darkerText,
);

const TextStyle headline = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.bold,
  fontSize: 24,
  letterSpacing: 0.27,
  color: darkerText,
);

const TextStyle title = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.bold,
  fontSize: 16,
  letterSpacing: 0.18,
  color: darkerText,
);

const TextStyle subtitle = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  letterSpacing: -0.04,
  color: darkText,
);

const TextStyle body2 = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  letterSpacing: 0.2,
  color: darkText,
);

const TextStyle body1 = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 16,
  letterSpacing: -0.05,
  color: darkText,
);

const TextStyle caption = TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.w400,
  fontSize: 12,
  letterSpacing: 0.2,
  color: lightText, // was lightText
);
