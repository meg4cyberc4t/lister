import 'package:flutter/material.dart';
import 'package:lister/components/FolderTitle.dart';
import 'package:lister/components/MaterialButtonSettings.dart';
import 'package:lister/pages/settingsPages/settingsVariablesPage.dart';
import 'package:lister/variables.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[1],
      appBar: AppBar(
        title: Text(
          'Настройки',
          style: TextStyle(fontSize: fontSize2),
        ),
        centerTitle: true,
        backgroundColor: colors[0],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          FolderTitle(title: 'Общие'),
          MaterialButtonSettings(title: 'Тема'),
          MaterialButtonSettings(title: 'Звук выполнения задачи'),
          MaterialButtonSettings(title: 'Папки'),
          MaterialButtonSettings(title: 'Закреплённые задачи'),
          MaterialButtonSettings(title: 'Язык'),
          SizedBox(height: 10),
          FolderTitle(title: 'О сервисе'),
          MaterialButtonSettings(title: 'Версия'),
          MaterialButtonSettings(title: 'Поддержка'),
          MaterialButtonSettings(title: 'Разработчики'),
          SizedBox(height: 10),
          FolderTitle(title: 'Специальные настройки'),
          MaterialButtonSettings(
              title: 'Настройка переменных',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsVariablesPage()))),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
