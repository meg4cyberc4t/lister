import 'package:flutter/material.dart';
import 'package:lister/variables.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Настройки',
          style: TextStyle(fontSize: appBarTextTitleSize),
        ),
        centerTitle: true,
        backgroundColor: activeColorPrimary,
      ),
      body: Center(
        child: Text(
          'Да будут тут настройки, ацтаньте...',
          style: TextStyle(color: setTextColor),
        ),
      ),
    );
  }
}
