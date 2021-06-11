import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lister/components/dialogs/createDialog.dart';
import 'package:lister/components/ElevatedFloatingActionButton.dart';
import 'package:lister/components/controller.dart';
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
      backgroundColor: colors[1],
      appBar: AppBar(
        title: Text(
          'Задачи',
          style: TextStyle(fontSize: fontSize2),
        ),
        centerTitle: true,
        backgroundColor: colors[0],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ElevatedFloatingActionButton(
        title: 'Создать',
        onPressed: () => createAdderDialog(context, setState),
        onLongPress: () {},
      ),
      body: RefreshIndicator(
        onRefresh: () async =>
            Future.delayed(Duration(milliseconds: 400), () => setState(() {})),
        color: colors[2],
        backgroundColor: colors[0],
        child: ListView.builder(
          itemCount: ListerController.length,
          itemBuilder: (BuildContext context, int position) {
            return TableToDo(
              position: position,
              title: ListerController.getter(position),
              fatherSetState: () => setState(() {}),
            );
          },
        ),
      ),
    );
  }
}

class TableToDo extends StatefulWidget {
  TableToDo({
    this.position,
    this.title,
    this.fatherSetState,
    Key? key,
  }) : super(key: key);
  final position, title, fatherSetState;

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
      if (value == null) {
        fatherSetState();
      }
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
          ListerController.remove(widget.title);
          return true;
        },
        onDismissed: (actionType) {
          ListerController.remove(widget.title);
          if (actionType!.index == 1) {
            ListerController.deletedToDoCounterAdd();
          } else if (actionType.index == 0) {
            ListerController.doneToDoCounterAdd();
          }
          fatherSetState();
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
            caption: 'Check',
            foregroundColor: Colors.white,
            color: colors[6],
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
                caption: 'Delete',
                color: colors[4],
                foregroundColor: Colors.white,
                icon: Icons.delete,
              )),
      child: Column(
        children: [
          Container(
            color: colors[1],
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: colors[2],
                      fontSize: MediaQuery.of(context).size.width < 400
                          ? MediaQuery.of(context).size.width / 16
                          : 400 / 16),
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: colors[0],
          ),
        ],
      ),
    );
  }
}
