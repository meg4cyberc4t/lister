import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lister/components/MyOutlinedButton.dart';
import 'package:lister/variables.dart';

Future<dynamic> alertRestartApp({
  required BuildContext context,
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
              Text('Внимание',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize2,
                  )),
              SizedBox(height: 10),
              Text('Для применения изменений перезапустите приложение!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize3,
                  )),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyOutlinedButton(
                      title: 'Далее',
                      submitFunction: () {
                        SystemNavigator.pop();
                        Navigator.pop(context);
                      }),
                ],
              )
            ],
          ),
        ));
      });
}
