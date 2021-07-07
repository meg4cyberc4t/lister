import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lister/components/myWidgets/FolderTitle.dart';
import 'package:lister/components/myWidgets/MyOutlinedButton.dart';
import 'package:lister/components/controllers/ListerController.dart';
import 'package:lister/components/dialogs/editDeadLineNoteDialog.dart';
import 'package:lister/components/dialogs/editDescriptionNoteDialog.dart';
import 'package:lister/components/dialogs/editSubtaskDialog.dart';
import 'package:lister/components/dialogs/editTitleNoteDialog.dart';
import 'package:lister/variables.dart';

Future<dynamic> infoNoteDialog(BuildContext context, setState, int id) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Сведения',
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontSize: fontSize1,
                    )),
                FolderTitle(title: 'Название задачи'),
                InkWell(
                  onTap: () => editTitleNoteDialog(context, setState, id),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            ListerController.databaseNotes[id].title,
                            overflow: TextOverflow.fade,
                            style: TextStyle(fontSize: fontSize2),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FolderTitle(title: 'Подзадачи:'),
                if (ListerController.databaseNotes[id].subtasks.isNotEmpty)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var subtask
                          in ListerController.databaseNotes[id].subtasks)
                        MyListTileWidget(
                            subtask: subtask, id: id, iSetState: setState),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: MyOutlinedButton(
                            title: 'Добавить',
                            onPressed: () =>
                                editSubtasksDialog(context, setState, id),
                          ),
                        ),
                      ),
                    ],
                  ),
                FolderTitle(title: 'Описание задачи'),
                if (ListerController.databaseNotes[id].description.isNotEmpty)
                  Column(
                    children: [
                      InkWell(
                        onTap: () =>
                            editDescriptionNoteDialog(context, setState, id),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  ListerController
                                      .databaseNotes[id].description,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(fontSize: fontSize2),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: MyOutlinedButton(
                            title: 'Добавить',
                            onPressed: () => editDescriptionNoteDialog(
                                context, setState, id),
                          ),
                        ),
                      ),
                    ],
                  ),
                FolderTitle(title: 'Создано'),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          DateFormat('dd.MM.yy HH:mm').format(
                              ListerController.databaseNotes[id].createTime),
                          style: TextStyle(fontSize: fontSize2),
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                FolderTitle(title: 'Завершение'),
                if (ListerController.databaseNotes[id].deadline != null)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () =>
                            editDeadLineNoteDialog(context, setState, id),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                DateFormat('dd.MM.yy HH:mm').format(
                                    ListerController
                                        .databaseNotes[id].deadline),
                                style: TextStyle(fontSize: fontSize2),
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: MyOutlinedButton(
                            title: 'Добавить',
                            onPressed: () =>
                                editDeadLineNoteDialog(context, setState, id),
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: MyOutlinedButton(
                        title: 'Назад',
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}

class MyListTileWidget extends StatefulWidget {
  const MyListTileWidget({
    Key? key,
    required this.id,
    required this.iSetState,
    required this.subtask,
  }) : super(key: key);

  final subtask;
  final id;
  final iSetState;

  @override
  _MyListTileWidgetState createState() => _MyListTileWidgetState();
}

class _MyListTileWidgetState extends State<MyListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width * 0.7,
      height: 40,
      child: Row(
        children: [
          Checkbox(
              value: widget.subtask.check,
              fillColor: MaterialStateProperty.all(currentThemeLight
                  ? defaultLightColors[2]
                  : defaultDarkColors[2]),
              checkColor: currentThemeLight
                  ? defaultLightColors[1]
                  : defaultDarkColors[1],
              onChanged: (value) =>
                  setState(() => widget.subtask.check = !widget.subtask.check)),
          Expanded(
            child: Container(
              child: Text(
                widget.subtask.title,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: fontSize2,
                    decoration: !widget.subtask.check
                        ? TextDecoration.none
                        : TextDecoration.lineThrough),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      onPressed: () {
        globalSetState(() => widget.subtask.check = !widget.subtask.check);
      },
      onLongPress: () {
        editSubtasksDialog(context, widget.iSetState, widget.id);
      },
    );
  }
}
