import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const ToDoDatabaseName = "ToDo";
const DatabasesPath = "../.AppData/lister";

const FontSize1 = 35.0;
const FontSize2 = 20.0;

const activeColorPrimary = Color(0xff212121);
const inactiveColorPrimary = CupertinoColors.systemGrey;

const colorDeletes = CupertinoColors.systemRed;
const colorMoments = CupertinoColors.systemGrey4;
const colorDones = CupertinoColors.activeGreen;

const backgroundColor = Color(0xFF353535);
const setTextColor = CupertinoColors.white;

const fontFamily = 'Montserrat';

// const activeColorPrimary = CupertinoColors.activeBlue;
// const inactiveColorPrimary = CupertinoColors.systemGrey;

// const colorDeletes = Color(0xFF402C84);
// const colorMoments = Color(0xFF6949D7);
// const colorDones = Color(0xFF866FD7);

const appBarTextTitleSize = 30.0;
const OutlinedButtonTextSize = 25.0;

ThemeData mainTheme = ThemeData(
  fontFamily: fontFamily,
  scaffoldBackgroundColor: backgroundColor,
  accentColor: activeColorPrimary,
);

SystemUiOverlayStyle mySystemTheme =
    SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.black);
