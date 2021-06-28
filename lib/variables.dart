import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const ToDoDatabaseName = "ToDo";
const SettingsDatabaseName = "Settings";
const DatabasesPath = "~/.AppData/lister";

double defaultFontSize1 = 10.0;
double defaultFontSize2 = 10.0;
double defaultFontSize3 = 10.0;

double fontSize1 = defaultFontSize1;
double fontSize2 = defaultFontSize2; // AppBarTitleSize
double fontSize3 = defaultFontSize3; // OutlinedButtonTextSize

double iconsBottomNavigationBarSize = 24.0;

bool boolStats = true;

String themeSettings = 'system';

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
  scaffoldBackgroundColor: defaultLightColors[3],
  accentColor: defaultLightColors[0],
  appBarTheme: AppBarTheme(
    backgroundColor: defaultLightColors[0],
  ),
  dialogBackgroundColor: defaultLightColors[1],
  dividerColor: defaultLightColors[0],
  textTheme: TextTheme(
    button: TextStyle(
      color: defaultLightColors[2],
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
  scaffoldBackgroundColor: defaultDarkColors[1],
  accentColor: defaultDarkColors[0],
  appBarTheme: AppBarTheme(
    backgroundColor: defaultDarkColors[0],
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: defaultDarkColors[0],
  ),
  dialogBackgroundColor: defaultDarkColors[1],
  dividerColor: defaultDarkColors[0],
);

bool currentThemeLight = true;

Function globalSetState = () {};
