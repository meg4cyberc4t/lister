import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lister/controller.dart';

class MomentPage extends StatelessWidget {
  const MomentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ListerController.mainList.length,
      itemBuilder: (BuildContext context, int position) {
        SlidableController _slidableController = SlidableController();
        return Slidable(
          key: Key(position.toString()),
          direction: Axis.horizontal,
          controller: _slidableController,
          closeOnScroll: true,
          dismissal: SlidableDismissal(
            child: SlidableDrawerDismissal(),
            closeOnCanceled: true,
            // onDismissed: (actionType) {},
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
          child: ListTile(
            title: Text(position.toString()),
            subtitle: Text('subtitle'),
            dense: true,
            leading: Icon(Icons.navigate_next_rounded),
            trailing: Icon(Icons.navigate_before_rounded),
          ),
        );
      },
    );
  }
}
