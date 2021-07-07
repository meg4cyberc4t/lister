import 'package:flutter/material.dart';
import 'package:lister/components/myWidgets/MyOutlinedButton.dart';
import 'package:lister/components/myWidgets/MyOutlinedButtonIcon.dart';
import 'package:lister/components/myWidgets/MyTextField.dart';
import 'package:lister/components/controllers/ListerController.dart';
import 'package:lister/components/dialogs/createDeadLineNoteDialog.dart';
import 'package:lister/components/dialogs/createDescriptionNoteDialog.dart';
import 'package:lister/components/dialogs/createSubtasksDialog.dart';
import 'package:lister/variables.dart';

String description = "";
DateTime? deadline;
List subtasks = [];

Future<dynamic> createAdderNoteDialog(BuildContext context, setState) {
  return showDialog(
      context: context,
      builder: (context) {
        TextEditingController _textEditingController = TextEditingController();
        Function unsubmitFunction = () {
          description = "";
          deadline = null;
          subtasks = [];
          Navigator.of(context).pop(false);
        };
        Function submitFunction = () {
          String text = _textEditingController.text.trim();
          if (text.isNotEmpty) {
            ListerController.addNote(
              title: text,
              createTime: DateTime.now(),
              description: description,
              deadline: deadline,
              subtasks: subtasks,
            );
            description = "";
            deadline = null;
            subtasks = [];
            setState(() {});
            Navigator.of(context).pop(false);
          } else {
            _textEditingController.text = '';
          }
        };
        return CreateNoteDialogWidget(
            textEditingController: _textEditingController,
            submitFunction: submitFunction,
            unsubmitFunction: unsubmitFunction);
      });
}

class CreateNoteDialogWidget extends StatefulWidget {
  const CreateNoteDialogWidget({
    Key? key,
    required TextEditingController textEditingController,
    required this.submitFunction,
    required this.unsubmitFunction,
  })  : _textEditingController = textEditingController,
        super(key: key);

  final TextEditingController _textEditingController;
  final Function submitFunction;
  final Function unsubmitFunction;

  @override
  _CreateNoteDialogWidgetState createState() => _CreateNoteDialogWidgetState();
}

class _CreateNoteDialogWidgetState extends State<CreateNoteDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Создание',
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: fontSize1,
                )),
            SizedBox(height: 10),
            MyTextField(
              labelText: 'Название задачи',
              controller: widget._textEditingController,
              onSubmitted: (text) => widget.submitFunction(),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: MyOutlinedButtonIcon(
                    icon: Icons.add_task_outlined,
                    active: subtasks.isNotEmpty,
                    onPressed: () => createSubtasksDialog(context, setState),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: MyOutlinedButtonIcon(
                    icon: Icons.timer_outlined,
                    active: deadline != null,
                    onPressed: () {
                      createDeadLineNoteDialog(context, setState);
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: MyOutlinedButtonIcon(
                    icon: Icons.description_outlined,
                    active: description.isNotEmpty,
                    onPressed: () {
                      createDescriptionNoteDialog(context, setState);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: MyOutlinedButton(
                    title: 'Назад',
                    onPressed: () => widget.unsubmitFunction(),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: MyOutlinedButton(
                    title: 'Далее',
                    onPressed: () => widget.submitFunction(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
