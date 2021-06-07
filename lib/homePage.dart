import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
        title: Text('Задачи'),
        centerTitle: true,
        backgroundColor: activeColorPrimary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: activeColorPrimary,
          onPressed: () {
            ListerController.add('title' + DateTime.now().toString());
            setState(() {});
          },
          label: Text('Создать')),
      body: ListView.builder(
        itemCount: ListerController.length,
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
  TableToDo({
    this.position,
    this.title,
    Key? key,
  }) : super(key: key);
  final position;
  final title;
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
      child: Container(
        color: Colors.white,
        height: 50,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
