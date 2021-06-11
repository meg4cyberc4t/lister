import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lister/components/controller.dart';
import 'package:lister/pages/homePage.dart';
import 'package:lister/pages/settingsPage.dart';
import 'package:lister/pages/statsPage.dart';
import 'package:lister/variables.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() async {
  await Hive.initFlutter();
  await ListerController.initialize();
  // SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
  print("ThemeMode.system");
  print(ThemeMode.system);
  runApp(
    MaterialApp(
      theme: mainThemeLight,
      darkTheme: mainThemeDark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Lister(),
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

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    currentThemeLight = Theme.of(context).brightness == Brightness.light;
    globalSetState = setState;
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _persistentTabController,
        backgroundColor:
            currentThemeLight ? Color(0xFF474747) : Color(0xFF212121),
        screens: [
          StatsPage(),
          HomePage(),
          SettingsPage(),
        ],
        items: _navBarsItems(),
        confineInSafeArea: true,
      ),
    );
  }
}
