import 'package:flutter/material.dart';
import 'package:lister/components/myWidgets/MyOutlinedButton.dart';
import 'package:lister/components/myWidgets/MyOutlinedButtonIcon.dart';
import 'package:lister/components/myWidgets/MyTextField.dart';
import 'package:lister/variables.dart';
import 'createNoteDialog.dart' show description;

Future<dynamic> createDescriptionNoteDialog(BuildContext context, setState) {
  return showDialog(
      context: context,
      builder: (context) {
        TextEditingController _textEditingController = TextEditingController();
        Function submitFunction = () {
          String text = _textEditingController.text.trim();
          setState(() {
            if (text.isNotEmpty) description = _textEditingController.text;
          });
          Navigator.of(context).pop(false);
        };
        if (description.isNotEmpty) _textEditingController.text = description;
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(9),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Описание задачи',
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: fontSize1,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                MyTextField(
                  controller: _textEditingController,
                  onSubmitted: (text) => submitFunction(),
                  hintText: '',
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: MyOutlinedButtonIcon(
                        icon: Icons.arrow_back_outlined,
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: MyOutlinedButton(
                        title: 'Сохранить',
                        onPressed: () => submitFunction(),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}
