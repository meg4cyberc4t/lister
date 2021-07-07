import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lister/variables.dart';

class SettingsController {
  static dynamic settingsStorage;

  static Future<dynamic> initialize() async {
    settingsStorage = await Hive.openBox(SettingsDatabaseName);

    themeSettings = settingsStorage.get('themeSettings') ?? 'system';
    settingsStorage.put('themeSettings', themeSettings);
    return 0;
  }

  static get getThemeSettings => settingsStorage.get('themeSettings');
  static void setThemeSettings(String value) {
    if (value == 'system' || value == 'dark' || value == 'light')
      settingsStorage.put('themeSettings', value);
    else
      throw 'Not found correct theme settings';
  }

  static void setFontFromScreenWidth(Size contextSize) {
    double widthScreen = contextSize.width;
    if (widthScreen < 400) {
      fontSize1 = widthScreen / 13;
      fontSize2 = widthScreen / 17;
      fontSize3 = widthScreen / 22;
    } else {
      fontSize1 = 400 / 15;
      fontSize2 = 400 / 20;
      fontSize3 = 400 / 22;
    }
  }
}
