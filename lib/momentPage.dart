import 'package:flutter/material.dart';
import 'package:lister/controller.dart';

class MomentPage extends StatelessWidget {
  const MomentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: ListerController.momentList.length,
        itemBuilder: (BuildContext context, int position) {
          String title =
              ListerController.getTitle(ListerController.momentList[position]);
          return Dismissible(
              onDismissed: (direction) {
                //DismissDirection.startToEnd
                if (direction == DismissDirection.startToEnd) {
                  ListerController.move(
                      position: position,
                      id: ListerController.momentList[position],
                      status: 0,
                      lastStatus: 1);
                } else {
                  ListerController.move(
                      position: position,
                      id: ListerController.momentList[position],
                      status: 2,
                      lastStatus: 1);
                }
              },
              key: Key(title),
              background: Container(color: Colors.red),
              secondaryBackground: Container(color: Colors.green),
              child: MaterialButton(
                onPressed: () {},
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
