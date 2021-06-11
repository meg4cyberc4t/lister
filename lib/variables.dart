import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const ToDoDatabaseName = "ToDo";
const DatabasesPath = "../.AppData/lister";

double fontSize1 = 35.0;
double fontSize2 = 30.0; // AppBarTitleSize
double fontSize3 = 20.0; // OutlinedButtonTextSize

const String fontFamily = 'Montserrat';
Map<int, Color> colors = {
  0: Color(0xFF212121), // activeColorPrimary
  1: Color(0xFF353535), // backgroundColor
  2: Color(0xFFFFFFFF), // setTextColor
  3: Color(0xFF8E8E93), // inactiveColorPrimary
  4: Color(0xFFFF3B30), // colorDeletes
  5: Color(0xFFD1D1D6), // colorMoments
  6: Color(0xFF34C759), // colorDones
};

const Map<int, Color> defaultColors = {
  0: Color(0xFF212121), // activeColorPrimary
  1: Color(0xFF353535), // backgroundColor
  2: Color(0xFFFFFFFF), // setTextColor
  3: Color(0xFF8E8E93), // inactiveColorPrimary
  4: Color(0xFFFF3B30), // colorDeletes
  5: Color(0xFFD1D1D6), // colorMoments
  6: Color(0xFF34C759), // colorDones
};

ThemeData mainTheme = ThemeData(
  fontFamily: fontFamily,
  scaffoldBackgroundColor: colors[1],
  accentColor: colors[0],
);

SystemUiOverlayStyle mySystemTheme =
    SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: colors[0]);

Function globalSetState = () {};
