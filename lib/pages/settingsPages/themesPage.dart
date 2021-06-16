import 'package:flutter/material.dart';
import 'package:lister/components/dialogs/alertRestartApp.dart';
import 'package:lister/components/settingsController.dart';
import 'package:lister/variables.dart';

class ThemesPage extends StatelessWidget {
  const ThemesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String activeTheme = SettingsController.getThemeSettings;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Тема',
          style: TextStyle(fontSize: fontSize2),
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
                        globalSetState(() {
                          SettingsController.setThemeSettings('light');
                          alertRestartApp(context: context);
                        });
                      }),
                  SizedBox(height: 10),
                  ThemesSettingsButton(
                      title: 'Тёмная',
                      active: activeTheme == 'dark',
                      onPressed: () {
                        globalSetState(() {
                          SettingsController.setThemeSettings('dark');
                          alertRestartApp(context: context);
                        });
                      }),
                  SizedBox(height: 10),
                  ThemesSettingsButton(
                      title: 'Системная',
                      active: activeTheme == 'system',
                      onPressed: () {
                        globalSetState(() {
                          SettingsController.setThemeSettings('system');
                          alertRestartApp(context: context);
                        });
                      }),
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
  }) : super(key: key);

  final title;
  final bool active;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: (active)
          ? BoxDecoration(
              border: Border.all(
                  color: currentThemeLight
                      ? Color(0xFF212121)
                      : Color(0xFFFFFFFF)))
          : BoxDecoration(),
      child: MaterialButton(
        onPressed: () => onPressed(),
        height: 45,
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: fontSize3),
          ),
        ),
      ),
    );
  }
}
