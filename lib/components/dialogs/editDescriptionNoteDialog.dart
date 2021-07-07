import 'package:flutter/material.dart';
import 'package:lister/components/myWidgets/MyOutlinedButton.dart';
import 'package:lister/components/myWidgets/MyOutlinedButtonIcon.dart';
import 'package:lister/components/myWidgets/MyTextField.dart';
import 'package:lister/components/controllers/ListerController.dart';
import 'package:lister/variables.dart';

Future<dynamic> editDescriptionNoteDialog(
    BuildContext context, setState, int id) {
  return showDialog(
      context: context,
      builder: (context) {
        TextEditingController _descriptionEditingController =
            TextEditingController(
                text: ListerController.databaseNotes[id].description);
        Function submitFunction = () {
          String description = _descriptionEditingController.text.trim();
          ListerController.editNote(id: id, newDescription: description);
          setState(() {});
          Navigator.of(context).pop(false);
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
                  labelText: 'Описание задачи',
                  hintText: '',
                  controller: _descriptionEditingController,
                  onSubmitted: (text) => submitFunction(),
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
