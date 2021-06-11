import 'package:flutter/material.dart';
import 'package:lister/components/FolderTitle.dart';
import 'package:lister/components/MaterialButtonSettings.dart';
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
        ],
      ),
    );
  }
}
