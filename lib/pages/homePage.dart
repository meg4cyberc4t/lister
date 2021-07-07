import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lister/components/dialogs/createNoteDialog.dart';
import 'package:lister/components/myWidgets/ElevatedFloatingActionButton.dart';
import 'package:lister/components/controllers/ListerController.dart';
import 'package:lister/components/dialogs/infoNoteDialog.dart';
import 'package:lister/variables.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Задачи',
          style: TextStyle(fontSize: fontSize1),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ElevatedFloatingActionButton(
        title: 'Создать',
        onPressed: () => createAdderNoteDialog(context, setState),
        onLongPress: () {},
      ),
      body: RefreshIndicator(
          onRefresh: () async => Future.delayed(
              Duration(milliseconds: 400), () => globalSetState(() {})),
          color: currentThemeLight
              ? defaultLightColors[2]!
              : defaultDarkColors[2]!,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 5),
            itemCount: ListerController.length,
            itemBuilder: (BuildContext context, int position) {
              int id = ListerController.mainList[position];
              return TableToDo(
                key: Key(id.toString()),
                id: id,
                title: ListerController.databaseNotes[id]?.title,
                fatherSetState: globalSetState,
              );
            },
          )),
    );
  }
}

class TableToDo extends StatefulWidget {
  TableToDo({
    this.id,
    this.title,
    this.fatherSetState,
    required Key key,
  }) : super(key: key);
  final id, title, fatherSetState;

  @override
  _TableToDoState createState() =>
      _TableToDoState(fatherSetState: fatherSetState);
}

class _TableToDoState extends State<TableToDo> {
  _TableToDoState({this.fatherSetState});
  final fatherSetState;
  @override
  Widget build(BuildContext context) {
    SlidableController _slidableController =
        SlidableController(onSlideAnimationChanged: (value) {
      if (value == null) fatherSetState(() {});
    });
    int subtasksAll = ListerController.databaseNotes[widget.id].subtasks.length;
    int subtasksCheck = 0;
    for (var subtask in ListerController.databaseNotes[widget.id].subtasks) {
      if (subtask.check) subtasksCheck += 1;
    }
    return Slidable.builder(
      key: Key(widget.title),
      enabled: true,
      direction: Axis.horizontal,
      controller: _slidableController,
      closeOnScroll: true,
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        onWillDismiss: (actionType) async {
          ListerController.removeNote(widget.id);
          return true;
        },
        onDismissed: (actionType) {
          ListerController.removeNote(widget.id);
          if (actionType!.index == 1) {
            ListerController.deleteNoteCounterAdd();
          } else if (actionType.index == 0) {
            ListerController.doneNoteCounterAdd();
          }
          fatherSetState(() {});
        },
        dismissThresholds: {
          SlideActionType.secondary: 0.2,
          SlideActionType.primary: 0.2,
        },
        resizeDuration: Duration(milliseconds: 200),
      ),
      actionPane: SlidableScrollActionPane(),
      actionExtentRatio: 0,
      actionDelegate: SlideActionBuilderDelegate(
        actionCount: 1,
        builder: (context, index, animation, step) {
          return IconSlideAction(
            caption: 'Выполнить',
            foregroundColor: Colors.white,
            color: currentThemeLight
                ? defaultLightColors[6]!
                : defaultDarkColors[6]!,
            iconWidget: Icon(
              Icons.check,
              color: Colors.white,
            ),
          );
        },
      ),
      secondaryActionDelegate: SlideActionBuilderDelegate(
          actionCount: 1,
          builder: (context, index, animation, step) => IconSlideAction(
                caption: 'Удалить',
                color: currentThemeLight
                    ? defaultLightColors[4]!
                    : defaultDarkColors[4]!,
                foregroundColor: Colors.white,
                icon: Icons.delete,
              )),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        height: 50,
        color:
            currentThemeLight ? defaultLightColors[1]! : defaultDarkColors[1]!,
        onPressed: () => infoNoteDialog(context, fatherSetState, widget.id),
        child: Container(
          height: 50,
          child: Stack(children: [
            Center(
              child: Text(
                widget.title,
                overflow: TextOverflow.clip,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize2),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (ListerController
                            .databaseNotes[widget.id].description.isNotEmpty)
                          Icon(Icons.description, size: 10),
                        if (ListerController
                                .databaseNotes[widget.id].deadline !=
                            null)
                          Icon(Icons.timer_outlined, size: 10),
                      ],
                    ),
                    if (ListerController
                        .databaseNotes[widget.id].subtasks.isNotEmpty)
                      Text('$subtasksCheck/$subtasksAll',
                          style: TextStyle(fontSize: 10)),
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
