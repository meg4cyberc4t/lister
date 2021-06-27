import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lister/components/controller.dart';
import 'package:lister/components/settingsController.dart';
import 'package:lister/pages/homePage.dart';
import 'package:lister/pages/settingsPage.dart';
import 'package:lister/pages/statsPage.dart';
import 'package:lister/variables.dart';
import 'package:flutter/services.dart';
import 'components/models/counters.dart';
import 'components/models/note.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CountersAdapter());
  Hive.registerAdapter(NoteAdapter());
  await SettingsController.initialize();
  await ListerController.initialize();
  runApp(
    Main(),
  );
}

class Main extends StatefulWidget {
  const Main({
    Key? key,
  }) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    globalSetState = setState;
    return MaterialApp(
      theme: mainThemeLight,
      darkTheme: mainThemeDark,
      themeMode: (themeSettings == 'system')
          ? ThemeMode.system
          : (themeSettings == 'dark')
              ? ThemeMode.dark
              : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Lister(),
      title: 'Lister',
    );
  }
}

class Lister extends StatefulWidget {
  @override
  _ListerState createState() => _ListerState();
}

class _ListerState extends State<Lister> {
  PageController _mainPageViewController = PageController(initialPage: 1);

  @override
  void dispose() {
    _mainPageViewController.dispose();
    super.dispose();
  }

  int _selectedPage = 1;

  @override
  Widget build(BuildContext context) {
    currentThemeLight = Theme.of(context).brightness == Brightness.light;
    SystemChrome.setSystemUIOverlayStyle(currentThemeLight
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark);

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _mainPageViewController,
        children: SettingsController.getboolStats
            ? [
                StatsPage(),
                HomePage(),
                SettingsPage(),
              ]
            : [
                HomePage(),
                SettingsPage(),
              ],
        onPageChanged: (int value) {
          setState(() => _selectedPage = value);
        },
      ),
      bottomNavigationBar: MyBottomNavigationBar(
          mainPageViewController: _mainPageViewController,
          selectedPage: _selectedPage),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
    required PageController mainPageViewController,
    required int selectedPage,
  })  : _mainPageViewController = mainPageViewController,
        selectedPage = selectedPage,
        super(key: key);

  final PageController _mainPageViewController;
  final int selectedPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: currentThemeLight ? Color(0xFF474747) : Color(0xFF212121),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: currentThemeLight
                ? Color(0xFFEEEEEE).withOpacity(0.3)
                : Color(0xFF353535).withOpacity(0.3),
            hoverColor: currentThemeLight
                ? Color(0xFFEEEEEE).withOpacity(0.7)
                : Color(0xFF353535).withOpacity(0.7),
            gap: 8,
            activeColor: (currentThemeLight
                    ? defaultLightColors[3]
                    : defaultDarkColors[3]) ??
                Color(0),
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 200),
            tabBackgroundColor: currentThemeLight
                ? Color(0xFFEEEEEE).withOpacity(0.2)
                : Color(0xFF353535),
            color: (currentThemeLight
                    ? defaultLightColors[3]
                    : defaultDarkColors[3]) ??
                Color(0),
            tabs: SettingsController.getboolStats
                ? [
                    GButton(
                      icon: Icons.query_stats,
                      iconActiveColor:
                          currentThemeLight ? defaultLightColors[1] : null,
                      textColor:
                          currentThemeLight ? defaultLightColors[1] : null,
                      text: 'Статистика',
                    ),
                    GButton(
                      icon: Icons.home,
                      text: 'Задачи',
                      iconActiveColor:
                          currentThemeLight ? defaultLightColors[1] : null,
                      textColor:
                          currentThemeLight ? defaultLightColors[1] : null,
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Настройки',
                      iconActiveColor:
                          currentThemeLight ? defaultLightColors[1] : null,
                      textColor:
                          currentThemeLight ? defaultLightColors[1] : null,
                    ),
                  ]
                : [
                    GButton(
                      icon: Icons.home,
                      text: 'Задачи',
                      iconActiveColor:
                          currentThemeLight ? defaultLightColors[1] : null,
                      textColor:
                          currentThemeLight ? defaultLightColors[1] : null,
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Настройки',
                      iconActiveColor:
                          currentThemeLight ? defaultLightColors[1] : null,
                      textColor:
                          currentThemeLight ? defaultLightColors[1] : null,
                    ),
                  ],
            selectedIndex: selectedPage,
            onTabChange: (index) => _mainPageViewController.jumpToPage(
              index,
            ),
          ),
        ),
      ),
    );
  }
}
