import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const ToDoDatabaseName = "ToDo";
const DatabasesPath = "../.AppData/lister";

double fontSize1 = 35.0;
double fontSize2 = 30.0; // AppBarTitleSize
double fontSize3 = 20.0; // OutlinedButtonTextSize

const String fontFamily = 'Montserrat';

const Map<int, Color> defaultLightColors = {
  0: Color(0xFF474747), // activeColorPrimary
  1: Color(0xFFEEEEEE), // backgroundColor
  2: Color(0xFF212121), // setTextColor
  3: Color(0xFFEEEEEE), // inactiveColorPrimary
  4: Color(0xFFFF534A), // colorDeletes
  5: Color(0xFFEFEF86), // colorMoments
  6: Color(0xFF46CF68), // colorDones
};

ThemeData mainThemeLight = ThemeData(
  brightness: Brightness.light,
  fontFamily: fontFamily,
  scaffoldBackgroundColor: Color(0xFFEEEEEE),
  accentColor: Color(0xFF474747),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF474747),
  ),
  dialogBackgroundColor: Color(0xFFEEEEEE),
  dividerColor: Color(0xFF474747),
  textTheme: TextTheme(
    button: TextStyle(
      color: Color(0xFF000000),
    ),
  ),
);

const Map<int, Color> defaultDarkColors = {
  0: Color(0xFF212121), // activeColorPrimary
  1: Color(0xFF353535), // backgroundColorw
  2: Color(0xFFFFFFFF), // setTextColor
  3: Color(0xFF8E8E93), // inactiveColorPrimary
  4: Color(0xFFFF3B30), // colorDeletes
  5: Color(0xFFD1D1D6), // colorMoments
  6: Color(0xFF34C759), // colorDones
};

ThemeData mainThemeDark = ThemeData(
  brightness: Brightness.dark,
  fontFamily: fontFamily,
  scaffoldBackgroundColor: Color(0xFF353535),
  accentColor: Color(0xFF212121),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF212121),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF212121),
  ),
  dialogBackgroundColor: Color(0xFF353535),
  dividerColor: Color(0xFF212121),
);

bool currentThemeLight = true;

Function globalSetState = () {};
