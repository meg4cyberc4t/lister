import 'package:flutter/material.dart';
import 'package:lister/components/MyOutlinedButton.dart';
import 'package:lister/components/controller.dart';
import 'package:lister/variables.dart';

Future<dynamic> infoNoteDialog(BuildContext context, int id) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Сведения',
                    style: TextStyle(
                      fontSize: fontSize2,
                    )),
                SizedBox(height: 10),
                Text(
                  'Название задачи: ${ListerController.databaseNotes[id].title}',
                  style: TextStyle(fontSize: fontSize3),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Время создания: ${ListerController.databaseNotes[id].createTime.hour}:${ListerController.databaseNotes[id].createTime.minute}',
                  style: TextStyle(fontSize: fontSize3),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Дата создания: ${ListerController.databaseNotes[id].createTime.day}.${ListerController.databaseNotes[id].createTime.month}.${ListerController.databaseNotes[id].createTime.year}',
                  style: TextStyle(fontSize: fontSize3),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyOutlinedButton(
                      title: 'Назад',
                      submitFunction: () => Navigator.of(context).pop(false),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
