import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lister/components/controller.dart';
import 'package:lister/components/models/group.dart';
import 'package:lister/components/settingsController.dart';
import 'package:lister/pages/homePage.dart';
import 'package:lister/pages/settingsPage.dart';
import 'package:lister/pages/statsPage.dart';
import 'package:lister/variables.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'components/models/counters.dart';
import 'components/models/note.dart';
import 'components/models/group.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CountersAdapter());
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(GroupAdapter());
  await SettingsController.initialize();
  await ListerController.initialize();

  runApp(
    MaterialApp(
      theme: mainThemeLight,
      darkTheme: mainThemeDark,
      themeMode: (themeSettings == 'system')
          ? ThemeMode.system
          : (themeSettings == 'dark')
              ? ThemeMode.dark
              : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Lister(),
      title: 'lister',
    ),
  );
}

class Lister extends StatefulWidget {
  @override
  _ListerState createState() => _ListerState();
}

class _ListerState extends State<Lister> {
  PersistentTabController _persistentTabController =
      PersistentTabController(initialIndex: 1);

  @override
  Widget build(BuildContext context) {
    currentThemeLight = Theme.of(context).brightness == Brightness.light;
    SystemChrome.setSystemUIOverlayStyle(currentThemeLight
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark);
    globalSetState = setState;
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _persistentTabController,
        backgroundColor:
            currentThemeLight ? Color(0xFF474747) : Color(0xFF212121),
        screens: boolStats
            ? [
                StatsPage(),
                HomePage(),
                SettingsPage(),
              ]
            : [
                HomePage(),
                SettingsPage(),
              ],
        items: boolStats
            ? [
                PersistentBottomNavBarItem(
                  icon: Icon(Icons.query_stats),
                  title: 'Статистика',
                  activeColorPrimary: (currentThemeLight
                          ? defaultLightColors[3]
                          : defaultDarkColors[3]) ??
                      Color(0),
                ),
                PersistentBottomNavBarItem(
                  icon: Icon(Icons.home),
                  title: 'Задачи',
                  activeColorPrimary: (currentThemeLight
                          ? defaultLightColors[3]
                          : defaultDarkColors[3]) ??
                      Color(0),
                ),
                PersistentBottomNavBarItem(
                  icon: Icon(Icons.settings),
                  title: 'Настройки',
                  activeColorPrimary: (currentThemeLight
                          ? defaultLightColors[3]
                          : defaultDarkColors[3]) ??
                      Color(0),
                ),
              ]
            : [
                PersistentBottomNavBarItem(
                  icon: Icon(Icons.home),
                  title: 'Задачи',
                  activeColorPrimary: (currentThemeLight
                          ? defaultLightColors[3]
                          : defaultDarkColors[3]) ??
                      Color(0),
                ),
                PersistentBottomNavBarItem(
                  icon: Icon(Icons.settings),
                  title: 'Настройки',
                  activeColorPrimary: (currentThemeLight
                          ? defaultLightColors[3]
                          : defaultDarkColors[3]) ??
                      Color(0),
                ),
              ],
        confineInSafeArea: true,
      ),
    );
  }
}
