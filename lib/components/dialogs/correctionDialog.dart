import 'package:flutter/material.dart';
import 'package:lister/components/MyOutlinedButton.dart';
import 'package:lister/components/controller.dart';
import 'package:lister/variables.dart';

Future<dynamic> correctionDialog({
  required BuildContext context,
  required Function setState,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Отчистить историю?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize2,
                  )),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyOutlinedButton(
                    title: 'Нет',
                    submitFunction: () => Navigator.of(context).pop(false),
                  ),
                  MyOutlinedButton(
                    title: 'Да',
                    submitFunction: () {
                      setState(() => ListerController.clearStats());
                      Navigator.of(context).pop(false);
                    },
                  ),
                ],
              )
            ],
          ),
        ));
      });
}
