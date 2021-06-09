import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lister/Dialogs/createDialog.dart';
import 'package:lister/components/ElevatedFloatingActionButton.dart';
import 'package:lister/controller.dart';
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
          style: TextStyle(fontSize: appBarTextTitleSize),
        ),
        centerTitle: true,
        backgroundColor: activeColorPrimary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ElevatedFloatingActionButton(
        title: 'Создать',
        onPressed: () => createAdderDialog(context, setState),
        onLongPress: () {},
      ),
      body: ListView.builder(
        itemCount: ListerController.length,
        itemBuilder: (BuildContext context, int position) {
          return TableToDo(
            position: position,
            title: ListerController.getter(position),
            fatherSetState: () => setState(() {}),
          );
        },
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
            color: colorDones,
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
                color: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
              )),
      child: Column(
        children: [
          Container(
            color: backgroundColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: setTextColor,
                      fontSize: MediaQuery.of(context).size.width < 400
                          ? MediaQuery.of(context).size.width / 16
                          : 400 / 16),
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Color(0xFF212121),
          ),
        ],
      ),
    );
  }
}
