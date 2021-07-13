import 'package:flutter/material.dart';

const Map<String, double> fontSize = {
  'Middle': 28.0, // fontSize['Middle']
  'MiniMiddle': 23.5, // fontSize['MiniMiddle']
  'Small': 17.5,
  'Mini': 15.0,
};

const Map<String, Color> themeDataLightColors = {
  'Main': Color(0xFF3f3f40), // themeDataLightColors['Main']
  'Secondary': Color(0xFFF2F2F3), // themeDataLightColors['Secondary']
  'Accent': Color(0xFF2B2B2C), // themeDataLightColors['Accent']
};

const Duration DataDuration = Duration(milliseconds: 500);

const String FontFamily = 'Montserrat';

ThemeData themeDataLight = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: themeDataLightColors['Accent']),
    fontFamily: FontFamily,
    primaryColor: themeDataLightColors['Main'],
    backgroundColor: themeDataLightColors['Secondary'],
    dialogBackgroundColor: themeDataLightColors['Secondary'],
    scaffoldBackgroundColor: themeDataLightColors['Secondary'],
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: themeDataLightColors['Secondary']),
    accentColor: themeDataLightColors['Accent'],
    secondaryHeaderColor: themeDataLightColors['Secondary'],
    iconTheme: IconThemeData(color: themeDataLightColors['Main']),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: themeDataLightColors['Accent'],
        foregroundColor: themeDataLightColors['Accent'],
        titleTextStyle: TextStyle(
            fontSize: fontSize['Middle'],
            color: themeDataLightColors['Secondary'])),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
            TextStyle(fontSize: fontSize['Small'], fontFamily: FontFamily)),
        foregroundColor:
            MaterialStateProperty.all(themeDataLightColors['Accent']),
        overlayColor: MaterialStateProperty.all(
            themeDataLightColors['Accent']!.withOpacity(0.2)),
        animationDuration: DataDuration,
        alignment: Alignment.center,
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.all(3),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: themeDataLightColors['Main']!, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: themeDataLightColors['Main']!, width: 0),
            borderRadius: BorderRadius.all(Radius.circular(10)))),
    textTheme: TextTheme(
      headline1: TextStyle(color: themeDataLightColors['Accent']),
      headline2: TextStyle(color: themeDataLightColors['Accent']),
      headline3: TextStyle(color: themeDataLightColors['Accent']),
      headline4: TextStyle(color: themeDataLightColors['Accent']),
      headline5: TextStyle(color: themeDataLightColors['Accent']),
      headline6: TextStyle(color: themeDataLightColors['Accent']),
      subtitle1: TextStyle(color: themeDataLightColors['Accent']),
      subtitle2: TextStyle(color: themeDataLightColors['Accent']),
      bodyText1: TextStyle(color: themeDataLightColors['Accent']),
      bodyText2: TextStyle(color: themeDataLightColors['Accent']),
    ));

const Map<String, Color> themeDataDarkColors = {
  'Main': Color(0xFFF2F2F3), // themeDataLightColors['Main']
  'Secondary': Color(0xFF3f3f40), // themeDataLightColors['Secondary']
  'Accent': Color(0xFF2B2B2C), // themeDataLightColors['Accent']
};

ThemeData themeDataDark = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: themeDataDarkColors['Accent']),
    fontFamily: FontFamily,
    primaryColor: themeDataDarkColors['Main'],
    backgroundColor: themeDataDarkColors['Secondary'],
    dialogBackgroundColor: themeDataDarkColors['Secondary'],
    scaffoldBackgroundColor: themeDataDarkColors['Secondary'],
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: themeDataDarkColors['Secondary']),
    accentColor: themeDataDarkColors['Main'],
    secondaryHeaderColor: themeDataDarkColors['Secondary'],
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: themeDataDarkColors['Accent'],
        foregroundColor: themeDataDarkColors['Accent'],
        titleTextStyle: TextStyle(
            fontSize: fontSize['Middle'], color: themeDataDarkColors['Main'])),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
            TextStyle(fontSize: fontSize['Small'], fontFamily: FontFamily)),
        foregroundColor: MaterialStateProperty.all(themeDataDarkColors['Main']),
        overlayColor: MaterialStateProperty.all(
            themeDataDarkColors['Accent']!.withOpacity(0.2)),
        animationDuration: DataDuration,
        alignment: Alignment.center,
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        alignLabelWithHint: true,
        hintStyle:
            TextStyle(color: themeDataDarkColors['Main']!.withOpacity(0.5)),
        contentPadding: EdgeInsets.all(3),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: themeDataDarkColors['Main']!, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: themeDataDarkColors['Main']!, width: 0),
            borderRadius: BorderRadius.all(Radius.circular(10)))),
    iconTheme: IconThemeData(color: themeDataDarkColors['Main']),
    textTheme: TextTheme(
      headline1: TextStyle(color: themeDataDarkColors['Main']),
      headline2: TextStyle(color: themeDataDarkColors['Main']),
      headline3: TextStyle(color: themeDataDarkColors['Main']),
      headline4: TextStyle(color: themeDataDarkColors['Main']),
      headline5: TextStyle(color: themeDataDarkColors['Main']),
      headline6: TextStyle(color: themeDataDarkColors['Main']),
      subtitle1: TextStyle(color: themeDataDarkColors['Main']),
      subtitle2: TextStyle(color: themeDataDarkColors['Main']),
      bodyText1: TextStyle(color: themeDataDarkColors['Main']),
      bodyText2: TextStyle(color: themeDataDarkColors['Main']),
    ));
