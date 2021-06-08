import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lister/Dialogs/createDialog.dart';
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
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: activeColorPrimary,
          onPressed: () {
            createAdderDialog(context, setState);
          },
          label: Text('Создать')),
      body: ListView.builder(
        itemCount: ListerController.length,
        // separatorBuilder: (context, index) => Divider(
        //   height: 1,
        //   color: Color(0xFF212121),
        // ),
        itemBuilder: (BuildContext context, int position) {
          return TableToDo(
            position: position,
            title: ListerController.getter(position),
          );
        },
      ),
    );
  }
}

class TableToDo extends StatelessWidget {
  TableToDo({this.position, this.title, Key? key}) : super(key: key);
  final position, title;
  final SlidableController _slidableController = SlidableController();

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(title),
      direction: Axis.horizontal,
      controller: _slidableController,
      closeOnScroll: true,
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        onDismissed: (actionType) {
          if (actionType!.index == 1) {
            ListerController.deletedToDoCounterAdd();
          } else if (actionType.index == 0) {
            ListerController.doneToDoCounterAdd();
          }
          ListerController.remove(title);
        },
        dismissThresholds: {
          SlideActionType.secondary: 0.2,
          SlideActionType.primary: 0.2,
        },
        resizeDuration: Duration(milliseconds: 500),
      ),
      actionPane: SlidableStrechActionPane(),
      actionExtentRatio: 0,
      actions: [
        IconSlideAction(
          caption: 'Check',
          foregroundColor: Colors.white,
          color: Colors.green[400],
          iconWidget: Icon(
            Icons.check,
            color: Colors.white,
          ),
        )
      ],
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
        )
      ],
      child: Column(
        children: [
          Container(
            color: backgroundColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
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
