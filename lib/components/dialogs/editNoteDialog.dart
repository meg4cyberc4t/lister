import 'package:flutter/material.dart';
import 'package:lister/components/MyOutlinedButton.dart';
import 'package:lister/components/MyTextField.dart';
import 'package:lister/components/controller.dart';
import 'package:lister/variables.dart';

Future<dynamic> editNoteDialog(BuildContext context, setState, int id) {
  return showDialog(
      context: context,
      builder: (context) {
        TextEditingController _textEditingController = TextEditingController(
            text: ListerController.databaseNotes[id].title);
        Function submitFunction = () {
          String text = _textEditingController.text.trim();
          if (text.isNotEmpty) {
            ListerController.editNote(id: id, newTitle: text);
            setState(() {});
            Navigator.of(context).pop(false);
          } else {
            // SnackBar(content: Snack)
            _textEditingController.text = '';
          }
        };
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Редактирование',
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontSize: fontSize1,
                    )),
                SizedBox(height: 10),
                MyTextField(
                  labeltext: 'Название задачи',
                  textEditingController: _textEditingController,
                  onSubmitted: submitFunction,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyOutlinedButton(
                      title: 'Назад',
                      submitFunction: () => Navigator.of(context).pop(false),
                    ),
                    MyOutlinedButton(
                      title: 'Далее',
                      submitFunction: submitFunction,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}
