import 'package:hive/hive.dart';
import 'package:lister/variables.dart';

class SettingsController {
  static dynamic settingsStorage;

  static Future<dynamic> initialize() async {
    settingsStorage = await Hive.openBox(SettingsDatabaseName);
    fontSize1 = settingsStorage.get('fontSize1') ?? 35.0;
    fontSize2 = settingsStorage.get('fontSize2') ?? 30.0;
    fontSize3 = settingsStorage.get('fontSize3') ?? 20.0;
    boolStats = settingsStorage.get('boolStats') ?? true;
    themeSettings = settingsStorage.get('themeSettings') ?? 'system';
    settingsStorage.put('fontSize1', fontSize1);
    settingsStorage.put('fontSize2', fontSize2);
    settingsStorage.put('fontSize3', fontSize3);
    settingsStorage.put('boolStats', boolStats);
    settingsStorage.put('themeSettings', themeSettings);
    return 0;
  }

  static get getfontSize1 => settingsStorage.get('fontSize1');
  static void setFontSize1(double? size) {
    if (size != null) settingsStorage.put('fontSize1', size);
  }

  static get getfontSize2 => settingsStorage.get('fontSize2');
  static void setFontSize2(double? size) {
    if (size != null) settingsStorage.put('fontSize2', size);
  }

  static get getfontSize3 => settingsStorage.get('fontSize3');
  static void setFontSize3(double? size) {
    if (size != null) settingsStorage.put('fontSize3', size);
  }

  static get getboolStats => settingsStorage.get('boolStats');
  static void setboolStats(bool value) =>
      settingsStorage.put('boolStats', value);

  static get getThemeSettings => settingsStorage.get('themeSettings');
  static void setThemeSettings(String value) {
    if (value == 'system' || value == 'dark' || value == 'light')
      settingsStorage.put('themeSettings', value);
    else
      throw 'Not found correct theme settings';
  }
}
