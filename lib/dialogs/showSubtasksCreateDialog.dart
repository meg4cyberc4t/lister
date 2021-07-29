import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lister/architecture/themeSettings.dart';

Future<List?> showSubtasksCreateDialog(BuildContext context, List subtasks) {
  final GlobalKey<AnimatedListState> listSubtaskKey = GlobalKey();

  List<TextEditingController> controllers = [];
  for (var subtask in subtasks)
    controllers.add(TextEditingController(text: subtask[0]));
  return showGeneralDialog(
    context: context,
    transitionDuration: DataDuration,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curvedValue = 1.0 - Curves.ease.transform(animation.value);
      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
        child: Opacity(opacity: animation.value, child: child),
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) => _DialogWidget(
        controllers: controllers,
        subtasks: subtasks,
        listSubtaskKey: listSubtaskKey),
  );
}

class _DialogWidget extends StatelessWidget {
  const _DialogWidget({
    Key? key,
    required this.controllers,
    required this.listSubtaskKey,
    subtasks,
  })  : _subtasks = subtasks,
        super(key: key);

  final List<TextEditingController> controllers;
  final _subtasks;
  final listSubtaskKey;

  @override
  Widget build(BuildContext context) {
    List subtasks = _subtasks;
    return Dialog(
      child: Container(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Подзадачи',
                    style: TextStyle(fontSize: fontSize['MiniMiddle']),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.maxFinite,
                    height: 200,
                    child: AnimatedList(
                      key: listSubtaskKey,
                      initialItemCount: controllers.length,
                      itemBuilder: (context, index, animation) => _buildsubtask(
                          animation, index, context, controllers[index]),
                    ),
                  ),
                  if (controllers.length > 0) SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _addSubtask(controllers.length, context);
                          },
                          child: Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.add_outlined),
                                SizedBox(width: 5),
                                Text(
                                  'Добавить',
                                  style: TextStyle(fontSize: fontSize['Small']),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (controllers.length > 0) {
                              _removeSubtask(controllers.length - 1, context,
                                  controllers[controllers.length - 1]);
                            }
                          },
                          child: Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.close),
                                SizedBox(width: 5),
                                Text(
                                  'Убрать',
                                  style: TextStyle(fontSize: fontSize['Small']),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          child: Text(
                            'Отчистить',
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            Navigator.pop(context, []);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          child: Text(
                            'Далее',
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            subtasks = [];
                            for (var controller in controllers) {
                              String textController = controller.text.trim();
                              if (textController.isNotEmpty)
                                subtasks.add([
                                  controller.text,
                                  false,
                                  new Random().nextInt(10000000)
                                ]);
                            }
                            Navigator.pop(context, subtasks);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void _removeSubtask(int index, BuildContext context,
      TextEditingController lastController) async {
    listSubtaskKey.currentState!.removeItem(
        index,
        (context, animation) =>
            _buildsubtask(animation, index, context, lastController));
    controllers.removeAt(index);
  }

  void _addSubtask(int index, BuildContext context) {
    controllers.add(TextEditingController());
    listSubtaskKey.currentState!.insertItem(index, duration: DataDuration);
  }

  FadeTransition _buildsubtask(Animation<double> animation, int index,
      BuildContext context, TextEditingController controller) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        height: 50,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(),
            Row(
              children: [
                Expanded(
                    child: Center(
                        child: Text(
                  (index + 1).toString(),
                  textAlign: TextAlign.center,
                ))),
                Expanded(
                  flex: 7,
                  child: TextFormField(
                    autocorrect: true,
                    autofocus: (index == controllers.length - 1),
                    controller: controller,
                    textAlign: TextAlign.start,
                    cursorWidth: 1,
                    cursorColor: Theme.of(context).accentColor,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).primaryColor.withOpacity(0.4),
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
