import 'package:flutter/material.dart';
import 'package:lister/components/FolderTitle.dart';
import 'package:lister/components/MaterialButtonSettings.dart';
import 'package:lister/components/MySwitchStatsSettings.dart';
import 'package:lister/pages/settingsPages/developersPage.dart';
import 'package:lister/pages/settingsPages/helpPage.dart';
import 'package:lister/pages/settingsPages/versionPage.dart';
import 'package:lister/variables.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Настройки',
          style: TextStyle(fontSize: fontSize2),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          FolderTitle(title: 'Общие'),
          MySwitchStatsSettings(title: 'Статистика'),
          MaterialButtonSettings(title: 'Тема'),
          MaterialButtonSettings(title: 'Шрифт'),
          SizedBox(height: 10),
          FolderTitle(title: 'О сервисе'),
          MaterialButtonSettings(
              title: 'Версия',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VersionPage(),
                  ))),
          MaterialButtonSettings(
              title: 'Поддержка / Обратная связь',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpPage(),
                  ))),
          MaterialButtonSettings(
              title: 'Разработчики',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DevelopersPage(),
                  ))),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
