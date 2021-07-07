import 'package:flutter/material.dart';
import 'package:lister/components/myWidgets/MyOutlinedButton.dart';
import 'package:lister/variables.dart';

Future<dynamic> correctionDialog({
  required BuildContext context,
  required Function setState,
  required String title,
  required Function submitFunction,
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
              Text(title,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize1,
                  )),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyOutlinedButton(
                    title: 'Нет',
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  MyOutlinedButton(
                    title: 'Да',
                    onPressed: () => submitFunction(),
                  ),
                ],
              )
            ],
          ),
        ));
      });
}
