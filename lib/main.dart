import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lister/controllers/HiveController.dart';
import 'package:lister/createDialogs/showDeadlineCreateDialog.dart';
import 'package:lister/createDialogs/showDescriptionCreateDialog.dart';
import 'package:lister/createDialogs/showSubtasksCreateDialog.dart';
import 'package:lister/models/ListBloc.dart';
import 'package:lister/models/createNoteForButtonsBloc.dart';
import 'package:lister/models/note.dart';
import 'package:lister/otherComponents/hints.dart';
import 'package:lister/widgets/MyElevatedActionButton.dart';
import 'package:flutter/services.dart';
import 'package:lister/variables.dart';

void main() async {
  await HiveController.initialize();
  runApp(Lister());
}

class Lister extends StatelessWidget {
  const Lister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        Theme.of(context).brightness == Brightness.light
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark);

    return MaterialApp(
      key: Key('Lister'),
      debugShowCheckedModeBanner: false,
      theme: themeDataLight,
      darkTheme: themeDataDark,
      title: 'Lister',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  Widget _buildListTile(Animation<double> animation, int position, Note note,
      BuildContext context, GlobalKey<AnimatedListState> _listKey) {
    return FadeTransition(
      opacity: animation,
      child: Dismissible(
        movementDuration: DataDuration,
        resizeDuration: DataDuration,
        key: Key(position.toString()),
        background: Container(color: Colors.green),
        secondaryBackground: Container(color: Colors.red),
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          _listKey.currentState!.removeItem(
              position,
              (context, animation) => SizedBox(
                    height: 0,
                    width: 0,
                  ));
          BlocProvider.of<ListBloc>(context).add(RemoveNote(note: note));
        },
        child: Column(
          children: [
            ListTile(
              title: Text(
                note.title,
              ),
              subtitle: (note.description.isNotEmpty)
                  ? Text(
                      note.description,
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.75)),
                    )
                  : null,
              trailing: (note.deadline != null || note.subtasks.isNotEmpty)
                  ? Container(
                      height: 100,
                      width: 100,
                      child: Column(
                        children: [
                          if (note.subtasks.isNotEmpty)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.assignment_turned_in_outlined,
                                  size: 15,
                                  color: Theme.of(context).accentColor,
                                ),
                                SizedBox(width: 1),
                                Text(note.subtasks.length.toString()),
                              ],
                            )
                          else
                            Container(),
                          if (note.deadline != null)
                            Text(DateFormat('H:mm yyyy.MM.dd')
                                .format(note.deadline!))
                          else
                            Container(),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                      ),
                    )
                  : null,
            ),
            Divider(
              color: Theme.of(context).primaryColor.withOpacity(0.4),
              height: 1,
            )
          ],
        ),
      ),
    );
  }

  void _removeListTile({
    required int index,
    required BuildContext context,
    required Note note,
    required GlobalKey<AnimatedListState> listKey,
  }) {
    BlocProvider.of<ListBloc>(context).add(RemoveNoteAt(position: index));
    listKey.currentState!.removeItem(
        index,
        (context, animation) =>
            _buildListTile(animation, index, note, context, listKey));
  }

  void _addListTile({
    required int index,
    required BuildContext context,
    required Note note,
    required GlobalKey<AnimatedListState> listKey,
  }) {
    BlocProvider.of<ListBloc>(context).add(AddNote(note: note));
    listKey.currentState!.insertItem(index, duration: DataDuration);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListBloc(HiveController.getMainList()),
      child: BlocBuilder<ListBloc, List>(
        builder: (context, mainList) {
          return Scaffold(
            key: Key('HomePage'),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: ElevatedFloatingActionButton(
              title: 'Создать',
              onPressed: () {
                String _hintText = Hint.get();
                showModalBottomSheetCreateNote(context, _hintText, mainList);
              },
            ),
            appBar: AppBar(
              title: Text(
                'Задачи',
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
            body: AnimatedList(
              key: _listKey,
              initialItemCount: mainList.length,
              itemBuilder: (context, position, animation) {
                if (position < mainList.length)
                  return _buildListTile(animation, position, mainList[position],
                      context, _listKey);
                else
                  return Container();
              },
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> showModalBottomSheetCreateNote(
      BuildContext context, String _hintText, List<dynamic> mainList) {
    TextEditingController _textEditingController = TextEditingController();
    String description = '';
    DateTime? deadline;
    List subtasks = [];
    return showModalBottomSheet(
        useRootNavigator: false,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (BuildContext bottomSheetContext) {
          return Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: const Radius.circular(5.0),
                        topRight: const Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Text('Создание задачи',
                        style: TextStyle(fontSize: fontSize['MiniMiddle'])),
                    SizedBox(height: 10),
                    TextFormField(
                      autocorrect: true,
                      autofocus: true,
                      textAlign: TextAlign.center,
                      cursorWidth: 1,
                      controller: _textEditingController,
                      cursorColor: Theme.of(context).accentColor,
                      decoration: InputDecoration(hintText: _hintText),
                    ),
                    BlocProvider(
                      create: (bottomSheetContext) =>
                          CreateNoteForButtonsBloc(),
                      child: BlocBuilder<CreateNoteForButtonsBloc, List<bool>>(
                        builder: (bottomSheetContext, state) {
                          return Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            state[0]
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .backgroundColor),
                                  ),
                                  child: Icon(
                                    Icons.timer_outlined,
                                    color: state[0]
                                        ? Theme.of(context).backgroundColor
                                        : Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () async {
                                    deadline = await showDeadlineCreateDialog(
                                        context, deadline);
                                    if (deadline == null)
                                      BlocProvider.of<CreateNoteForButtonsBloc>(
                                              bottomSheetContext)
                                          .add(CreateNoteForButtonsEvent
                                              .DeadlineOFF);
                                    else
                                      BlocProvider.of<CreateNoteForButtonsBloc>(
                                              bottomSheetContext)
                                          .add(CreateNoteForButtonsEvent
                                              .DeadlineON);
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            state[1]
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .backgroundColor),
                                  ),
                                  child: Icon(
                                    Icons.description_outlined,
                                    color: state[1]
                                        ? Theme.of(context).backgroundColor
                                        : Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () async {
                                    description =
                                        (await showDescriptionCreateDialog(
                                                    context, description) ??
                                                '')
                                            .trim();
                                    if (description.isNotEmpty) {
                                      BlocProvider.of<CreateNoteForButtonsBloc>(
                                              bottomSheetContext)
                                          .add(CreateNoteForButtonsEvent
                                              .DesciptionON);
                                    } else {
                                      BlocProvider.of<CreateNoteForButtonsBloc>(
                                              bottomSheetContext)
                                          .add(CreateNoteForButtonsEvent
                                              .DesciptionOFF);
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            state[2]
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .backgroundColor),
                                  ),
                                  child: Icon(
                                    Icons.add_task_outlined,
                                    color: state[2]
                                        ? Theme.of(context).backgroundColor
                                        : Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () async {
                                    subtasks = await showSubtasksCreateDialog(
                                            context, subtasks) ??
                                        [];
                                    if (subtasks.isEmpty)
                                      BlocProvider.of<CreateNoteForButtonsBloc>(
                                              bottomSheetContext)
                                          .add(CreateNoteForButtonsEvent
                                              .SubtasksOFF);
                                    else
                                      BlocProvider.of<CreateNoteForButtonsBloc>(
                                              bottomSheetContext)
                                          .add(CreateNoteForButtonsEvent
                                              .SubtasksON);
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 2,
                                child: OutlinedButton(
                                  child: Text('Далее'),
                                  onPressed: () {
                                    String title =
                                        _textEditingController.text.trim();
                                    if (title.isNotEmpty) {
                                      _addListTile(
                                        context: context,
                                        index: mainList.length,
                                        note: Note(
                                          title: _textEditingController.text
                                              .trim(),
                                          createTime: new DateTime.now(),
                                          description: description,
                                          deadline: deadline,
                                          subtasks: subtasks,
                                        ),
                                        listKey: _listKey,
                                      );
                                      BlocProvider.of<CreateNoteForButtonsBloc>(
                                              bottomSheetContext)
                                          .add(
                                              CreateNoteForButtonsEvent.AllOFF);
                                      subtasks = [];
                                      deadline = null;
                                      description = '';
                                      _textEditingController.text = '';
                                    }
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ], mainAxisSize: MainAxisSize.min),
                ),
              ));
        });
  }
}
