import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: mainTheme,
      theme: mainTheme,
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
        activeColorPrimary: colors[3] ?? Color(0),
        inactiveColorPrimary: colors[3],
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: 'Задачи',
        activeColorPrimary: colors[3] ?? Color(0),
        inactiveColorPrimary: colors[3],
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: 'Настройки',
        activeColorPrimary: colors[3] ?? Color(0),
        inactiveColorPrimary: colors[3],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    globalSetState = setState;
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _persistentTabController,
        backgroundColor: colors[0] ?? Color(0),
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
