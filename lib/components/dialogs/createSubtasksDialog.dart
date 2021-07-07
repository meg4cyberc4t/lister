import 'package:flutter/material.dart';
import 'package:lister/components/myWidgets/MyOutlinedButton.dart';
import 'package:lister/components/myWidgets/MyOutlinedButtonIcon.dart';
import 'package:lister/components/myWidgets/MyTextField.dart';
import 'package:lister/variables.dart';
import 'createNoteDialog.dart' show subtasks;

Future<dynamic> createSubtasksDialog(BuildContext context, setState) {
  return showDialog(
      context: context,
      builder: (context) {
        List<TextEditingController> _textEditingControllers = [];
        for (var subtask in subtasks) {
          _textEditingControllers.add(TextEditingController(text: subtask));
        }
        return CreateSubtasksDialogWidget(
            textEditingControllers: _textEditingControllers,
            iSetState: setState);
      });
}

class CreateSubtasksDialogWidget extends StatefulWidget {
  const CreateSubtasksDialogWidget({
    Key? key,
    this.textEditingControllers,
    this.iSetState,
  }) : super(key: key);

  final textEditingControllers;
  final iSetState;
  @override
  _CreateSubtasksDialogWidgetState createState() =>
      _CreateSubtasksDialogWidgetState();
}

class _CreateSubtasksDialogWidgetState
    extends State<CreateSubtasksDialogWidget> {
  @override
  Widget build(BuildContext context) {
    List _textEditingControllers = widget.textEditingControllers;

    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Подзадачи',
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: fontSize1,
                ),
                textAlign: TextAlign.center,
              ),
              if (_textEditingControllers.isNotEmpty)
                for (var i = 0; i < _textEditingControllers.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          child: Center(
                            child: Text((i + 1).toString(),
                                style: TextStyle(
                                    fontSize: fontSize2,
                                    color: currentThemeLight
                                        ? defaultLightColors[2]!
                                        : defaultDarkColors[2]!)),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: MyTextField(
                            controller: _textEditingControllers[i],
                            hintText: '',
                            contentPadding: EdgeInsets.all(3),
                          ),
                        ),
                      ],
                    ),
                  )
              else
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                          'Тут пока ничего нет.\n Попробуйте создать подзадачу по кнопке ниже!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: fontSize2,
                              color: currentThemeLight
                                  ? defaultLightColors[2]!
                                  : defaultDarkColors[2]!)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: currentThemeLight
                                ? defaultLightColors[2]!
                                : defaultDarkColors[2]!)),
                  ),
                ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 55,
                    child: MyOutlinedButton(
                      title: 'Добавить',
                      onPressed: () => setState(
                        () => _textEditingControllers
                            .add(TextEditingController()),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 44,
                    child: MyOutlinedButton(
                      title: 'Убрать',
                      onPressed: () {
                        if (_textEditingControllers.isNotEmpty)
                          setState(() => _textEditingControllers.removeLast());
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: MyOutlinedButtonIcon(
                      icon: Icons.arrow_back_outlined,
                      onPressed: () {
                        _textEditingControllers = [];
                        Navigator.of(context).pop(false);
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: MyOutlinedButton(
                      title: 'Сохранить',
                      onPressed: () {
                        widget.iSetState(() {
                          subtasks = [];
                          for (var controller in _textEditingControllers) {
                            String text = controller.text;
                            if (text.trim().isNotEmpty) subtasks.add(text);
                          }
                          _textEditingControllers = [];
                        });
                        Navigator.of(context).pop(false);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
