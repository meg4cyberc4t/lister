import 'package:flutter/material.dart';
import 'package:lister/components/settingsController.dart';
import 'package:lister/variables.dart';

class ThemesPage extends StatefulWidget {
  const ThemesPage({Key? key}) : super(key: key);

  @override
  _ThemesPageState createState() => _ThemesPageState();
}

class _ThemesPageState extends State<ThemesPage> {
  String activeTheme = SettingsController.getThemeSettings;
  var thisThemeLight;

  @override
  Widget build(BuildContext context) {
    thisThemeLight = (activeTheme == 'system')
        ? Theme.of(context).brightness == Brightness.light
        : activeTheme == 'light';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Тема',
          style: TextStyle(fontSize: fontSize1),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Выбор темы:', style: TextStyle(fontSize: fontSize2)),
                  SizedBox(height: 30),
                  ThemesSettingsButton(
                      title: 'Светлая',
                      active: activeTheme == 'light',
                      onPressed: () {
                        if (activeTheme != 'light')
                          globalSetState(() {
                            SettingsController.setThemeSettings('light');
                            themeSettings = 'light';
                            activeTheme = 'light';
                          });
                      },
                      thisThemeLight: thisThemeLight),
                  SizedBox(height: 10),
                  ThemesSettingsButton(
                      title: 'Тёмная',
                      active: activeTheme == 'dark',
                      onPressed: () {
                        if (activeTheme != 'dark')
                          globalSetState(() {
                            SettingsController.setThemeSettings('dark');
                            themeSettings = 'dark';
                            activeTheme = 'dark';
                          });
                      },
                      thisThemeLight: thisThemeLight),
                  SizedBox(height: 10),
                  ThemesSettingsButton(
                      title: 'Системная',
                      active: activeTheme == 'system',
                      onPressed: () {
                        if (activeTheme != 'system')
                          globalSetState(() {
                            SettingsController.setThemeSettings('system');
                            themeSettings = 'system';
                            activeTheme = 'system';
                          });
                      },
                      thisThemeLight: thisThemeLight),
                ],
              )),
        ),
      ),
    );
  }
}

class ThemesSettingsButton extends StatelessWidget {
  const ThemesSettingsButton({
    Key? key,
    required this.title,
    required this.active,
    required this.onPressed,
    required this.thisThemeLight,
  }) : super(key: key);

  final title;
  final bool active;
  final Function onPressed;
  final thisThemeLight;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: (active)
          ? BoxDecoration(
              border: Border.all(
                  color: thisThemeLight
                      ? defaultLightColors[2]!
                      : defaultDarkColors[2]!),
            )
          : BoxDecoration(),
      child: MaterialButton(
        onPressed: () => onPressed(),
        height: 50,
        minWidth: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: fontSize2),
          ),
        ),
      ),
    );
  }
}
