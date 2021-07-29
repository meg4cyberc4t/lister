import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lister/architecture/BLoCmodels/InfoDeadlineNoteBLoC.dart';
import 'package:lister/architecture/BLoCmodels/boolBLoC.dart';
import 'package:lister/architecture/BLoCmodels/checkBLoC.dart';
import 'package:lister/architecture/BLoCmodels/subtasksBLoC.dart';
import 'package:lister/architecture/HiveController.dart';
import 'package:lister/architecture/note.dart';
import 'package:lister/architecture/themeSettings.dart';
import 'package:lister/dialogs/showDeadlineCreateDialog.dart';

class InfoNotePage extends StatefulWidget {
  const InfoNotePage({
    Key? key,
    required this.note,
    required this.position,
  }) : super(key: key);
  final Note note;
  final int position;

  @override
  _InfoNotePageState createState() => _InfoNotePageState();
}

class _InfoNotePageState extends State<InfoNotePage> {
  Note? selectedNote;
  TextEditingController _textTitleEditingController = TextEditingController();
  TextEditingController _textDescriptionEditingController =
      TextEditingController();

  @override
  void initState() {
    selectedNote = widget.note;
    _textTitleEditingController.text = selectedNote!.title;
    _textDescriptionEditingController.text = selectedNote!.description;
    super.initState();
  }

  @override
  void dispose() {
    _textTitleEditingController.dispose();
    _textDescriptionEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _textTitleEditingController =
        TextEditingController(text: selectedNote!.title);
    TextEditingController _textDescriptionEditingController =
        TextEditingController(text: selectedNote!.description);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Детали',
            style: Theme.of(context).appBarTheme.titleTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Название',
                  style: TextStyle(fontSize: fontSize['MiniMiddle'])),
              TextFormField(
                onChanged: (value) {
                  if (value.isEmpty)
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Название обязательно!')));
                  else if ((value.isNotEmpty) && (value != widget.note.title)) {
                    List mainList = HiveController.getMainList();
                    mainList[widget.position] =
                        widget.note.copyWith(title: value);
                  }
                },
                onSaved: (newValue) {
                  if ((newValue != null) &&
                      (newValue.isNotEmpty) &&
                      (newValue != widget.note.title)) {
                    List mainList = HiveController.getMainList();
                    mainList[widget.position] =
                        widget.note.copyWith(title: newValue);
                  }
                },
                onFieldSubmitted: (value) {
                  if ((value.isNotEmpty) && (value != widget.note.title)) {
                    List mainList = HiveController.getMainList();
                    mainList[widget.position] =
                        widget.note.copyWith(title: value);
                    HiveController.saveMainList(mainList);
                  }
                },
                autocorrect: true,
                autofocus: false,
                controller: _textTitleEditingController,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize['Small']),
                cursorWidth: 1,
                cursorColor: Theme.of(context).accentColor,
                decoration: InputDecoration(
                  hintText: 'Название',
                  hintStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? themeDataDarkColors['InActive']
                          : themeDataLightColors['InActive']),
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                  height: 1,
                ),
              ),
              Text('Описание',
                  style: TextStyle(fontSize: fontSize['MiniMiddle'])),
              TextFormField(
                onChanged: (value) {
                  if (value != widget.note.description) {
                    List mainList = HiveController.getMainList();
                    mainList[widget.position] =
                        widget.note.copyWith(description: value);
                    HiveController.saveMainList(mainList);
                  }
                },
                onSaved: (newValue) {
                  if (newValue != widget.note.title) {
                    List mainList = HiveController.getMainList();
                    mainList[widget.position] =
                        widget.note.copyWith(title: newValue);
                    HiveController.saveMainList(mainList);
                  }
                },
                onFieldSubmitted: (value) {
                  if (value != widget.note.title) {
                    List mainList = HiveController.getMainList();
                    mainList[widget.position] =
                        widget.note.copyWith(description: value);
                    HiveController.saveMainList(mainList);
                  }
                },
                autocorrect: true,
                autofocus: false,
                controller: _textDescriptionEditingController,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize['Small']),
                cursorWidth: 1,
                cursorColor: Theme.of(context).accentColor,
                decoration: InputDecoration(
                  hintText: 'Описание',
                  hintStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? themeDataDarkColors['InActive']
                          : themeDataLightColors['InActive']),
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                  height: 1,
                ),
              ),
              Text('Время создания',
                  style: TextStyle(fontSize: fontSize['MiniMiddle'])),
              MaterialButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Нельзя поменять время создания!'))),
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      DateFormat('H:mm yyyy.MM.dd')
                          .format(selectedNote!.createTime),
                      style: TextStyle(
                          fontSize: fontSize['Small'],
                          color: Theme.of(context).accentColor),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                  height: 1,
                ),
              ),
              Text('Время завершения',
                  style: TextStyle(fontSize: fontSize['MiniMiddle'])),
              BlocProvider(
                create: (context) =>
                    InfoDeadlineNoteBLoC(selectedNote!.deadline),
                child: BlocBuilder<InfoDeadlineNoteBLoC, dynamic>(
                  builder: (context, selectedDeadline) {
                    return MaterialButton(
                      onPressed: () async {
                        DateTime? deadline = await showDeadlineCreateDialog(
                            context, selectedDeadline);
                        BlocProvider.of<InfoDeadlineNoteBLoC>(context)
                            .add(deadline);
                        List mainList = HiveController.getMainList();
                        mainList[widget.position] = widget.note.copyWith(
                            deadline: deadline, deadlineAvailable: true);
                        HiveController.saveMainList(mainList);
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                              (selectedDeadline == null)
                                  ? 'Добавить'
                                  : DateFormat('H:mm yyyy.MM.dd')
                                      .format(selectedDeadline),
                              style: TextStyle(
                                  fontSize: fontSize['Small'],
                                  color: selectedDeadline == null
                                      ? Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? themeDataDarkColors['InActive']
                                          : themeDataLightColors['InActive']
                                      : Theme.of(context).accentColor))),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Divider(
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                  height: 1,
                ),
              ),
              Text('Подзадачи',
                  style: TextStyle(fontSize: fontSize['MiniMiddle'])),
              SizedBox(height: 10),
              BlocProvider(
                create: (context) => SubtasksBLoC(selectedNote!.subtasks),
                child: BlocBuilder<SubtasksBLoC, List>(
                  builder: (context, state) {
                    print('SubtasksBLoC builder');
                    print(state);
                    return Column(
                      children: [
                        for (var l = 0; l < state.length; l++)
                          BlocProvider(
                            create: (context) => BoolBLoC(false),
                            child: BlocBuilder<BoolBLoC, bool>(
                              builder: (context, focus) {
                                List subtask = state[l];
                                TextEditingController
                                    _subtaskEditingController =
                                    TextEditingController(text: subtask[0]);
                                return BlocProvider(
                                  create: (context) => CheckBLoC(subtask[1]),
                                  child: BlocBuilder<CheckBLoC, bool>(
                                    builder: (context, check) {
                                      if (check != subtask[1])
                                        check = subtask[1];
                                      return Container(
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Checkbox(
                                                value: check,
                                                checkColor: Theme.of(context)
                                                    .secondaryHeaderColor,
                                                onChanged: (value) {
                                                  if (value == null) return;
                                                  subtask[1] = value;
                                                  BlocProvider.of<CheckBLoC>(
                                                          context)
                                                      .add(value);
                                                }),
                                            Expanded(
                                              child: FocusScope(
                                                child: Focus(
                                                  onFocusChange: (value) =>
                                                      BlocProvider.of<BoolBLoC>(
                                                              context)
                                                          .add(value),
                                                  child: TextFormField(
                                                    autofocus: state
                                                            .indexOf(subtask) ==
                                                        state.length - 1,
                                                    controller:
                                                        _subtaskEditingController,
                                                    style: TextStyle(
                                                      fontSize:
                                                          fontSize['Small'],
                                                      decoration: (check)
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : TextDecoration.none,
                                                    ),
                                                    onChanged:
                                                        (String? newValue) {
                                                      state.forEach((element) {
                                                        if (element[2] ==
                                                            subtask[2]) {
                                                          element[0] = newValue;
                                                          return;
                                                        }
                                                      });
                                                      print(state);
                                                    },
                                                    decoration: InputDecoration(
                                                      hintText: 'Подзадачка',
                                                      hintStyle: TextStyle(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? themeDataDarkColors[
                                                                  'InActive']
                                                              : themeDataLightColors[
                                                                  'InActive']),
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      border: InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      disabledBorder:
                                                          InputBorder.none,
                                                      focusedErrorBorder:
                                                          InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (focus)
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: IconButton(
                                                    splashRadius: 15,
                                                    onPressed: () {
                                                      for (var i = 0;
                                                          i < state.length;
                                                          i++) {
                                                        if (state[i][2] ==
                                                            subtask[2]) {
                                                          state
                                                              .remove(state[i]);
                                                          break;
                                                        }
                                                      }
                                                      widget.note.subtasks =
                                                          state;
                                                      BlocProvider.of<
                                                                  SubtasksBLoC>(
                                                              context)
                                                          .add(state);
                                                    },
                                                    icon: Icon(Icons.close,
                                                        size: 20),
                                                  )),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  state.add([
                                    '',
                                    false,
                                    new Random().nextInt(10000000)
                                  ]);
                                  widget.note.subtasks = state;
                                  BlocProvider.of<SubtasksBLoC>(context)
                                      .add(state);
                                },
                                child: Container(
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add),
                                      SizedBox(width: 5),
                                      Text(
                                        'Добавить подзадачу',
                                        style: TextStyle(
                                            fontSize: fontSize['Small']),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                  height: 1,
                ),
              ),
            ],
          ),
        )));
  }
}

Future<dynamic> showModalBottomSheetCreateSubtask(
    BuildContext context, List<dynamic> mainList) {
  TextEditingController _textEditingController = TextEditingController();
  return showModalBottomSheet(
      useRootNavigator: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (BuildContext bottomSheetContext) {
        return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom),
            decoration: const BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(5.0),
                    topRight: const Radius.circular(5.0))),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    'Создание подзадачи',
                    style: TextStyle(fontSize: fontSize['MiniMiddle']),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autocorrect: true,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    cursorWidth: 1,
                    controller: _textEditingController,
                    cursorColor: Theme.of(context).accentColor,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: OutlinedButton(
                          child: Text(
                            'Назад',
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: OutlinedButton(
                          child: Text(
                            'Далее',
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            String title = _textEditingController.text.trim();
                            if (title.isNotEmpty) {
                              mainList
                                  .add([_textEditingController.text, false]);
                              BlocProvider.of<SubtasksBLoC>(context)
                                  .add(mainList);
                              _textEditingController.text = '';
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ])));
      });
}
