import 'package:flutter/material.dart';
import 'package:lister/components/settingsController.dart';
import 'package:lister/variables.dart';

import 'dialogs/alertRestartApp.dart';

class MySwitchStatsSettings extends StatefulWidget {
  MySwitchStatsSettings({
    Key? key,
    required this.title,
  }) : super(key: key);
  final title;

  @override
  _MySwitchStatsSettingsState createState() => _MySwitchStatsSettingsState();
}

class _MySwitchStatsSettingsState extends State<MySwitchStatsSettings> {
  bool _switchValue = boolStats;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _switchValue = !_switchValue;
          SettingsController.setboolStats(_switchValue);
        });
        alertRestartApp(context: context);
      },
      onLongPress: () {
        setState(() {
          _switchValue = !_switchValue;
          SettingsController.setboolStats(_switchValue);
        });
        alertRestartApp(context: context);
      },
      child: Container(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.title,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width < 400
                              ? MediaQuery.of(context).size.width / 16
                              : 400 / 16),
                    ),
                  ),
                  Switch(
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                          SettingsController.setboolStats(_switchValue);
                        });
                        alertRestartApp(context: context);
                      })
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Divider(height: 1),
            ),
          ],
        ),
      ),
    );
  }
}
