import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lister/controller.dart';
import 'package:lister/homePage.dart';
import 'package:lister/settingsPage.dart';
import 'package:lister/statsPage.dart';
import 'package:lister/variables.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() async {
  await Hive.initFlutter();
  await ListerController.initialize();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Lister()));
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
        activeColorPrimary: activeColorPrimary,
        inactiveColorPrimary: inactiveColorPrimary,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: 'Задачи',
        activeColorPrimary: activeColorPrimary,
        inactiveColorPrimary: inactiveColorPrimary,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: 'Настройки',
        activeColorPrimary: activeColorPrimary,
        inactiveColorPrimary: inactiveColorPrimary,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _persistentTabController,
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
