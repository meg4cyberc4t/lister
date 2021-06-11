import 'package:flutter/material.dart';
import 'package:lister/components/MyOutlinedButton.dart';
import 'package:lister/components/MyTextField.dart';
import 'package:lister/components/controller.dart';
import 'package:lister/variables.dart';

Future<dynamic> createAdderDialog(BuildContext context, setState) {
  return showDialog(
      context: context,
      builder: (context) {
        TextEditingController _textEditingController = TextEditingController();
        Function submitFunction = () {
          String text = _textEditingController.text.trim();
          if (text.isNotEmpty) {
            ListerController.add(text);
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
                Text('Создание',
                    style: TextStyle(
                      fontSize: fontSize2,
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
