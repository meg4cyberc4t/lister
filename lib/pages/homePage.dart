import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lister/components/dialogs/createNoteDialog.dart';
import 'package:lister/components/ElevatedFloatingActionButton.dart';
import 'package:lister/components/controller.dart';
import 'package:lister/components/dialogs/editNoteDialog.dart';
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
          style: TextStyle(fontSize: fontSize2),
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
          color: currentThemeLight ? Color(0xFF474747) : Color(0xFFFFFFFF),
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
            color: currentThemeLight ? Color(0xFF46CF68) : Color(0xFF34C759),
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
                color:
                    currentThemeLight ? Color(0xFFFF534A) : Color(0xFFFF3B30),
                foregroundColor: Colors.white,
                icon: Icons.delete,
              )),
      child: MaterialButton(
        color: currentThemeLight ? Color(0xFFEEEEEE) : Color(0xFF353535),
        onPressed: () => editNoteDialog(context, fatherSetState, widget.id),
        onLongPress: () => infoNoteDialog(context, widget.id),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      widget.title,
                      overflow: TextOverflow.clip,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width < 400
                              ? MediaQuery.of(context).size.width / 16
                              : 400 / 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
