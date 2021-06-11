import 'package:flutter/material.dart';
import 'package:lister/components/controller.dart';
import 'package:lister/variables.dart';

Future<dynamic> correctionDialog({
  required BuildContext context,
  required Function setState,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: Container(
          padding: EdgeInsets.all(2),
          child: Container(
            color: colors[1],
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Отчистить историю?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize2,
                      color: colors[2],
                    )),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        overlayColor: MaterialStateProperty.all<Color>(
                            colors[2]!.withOpacity(0.1)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('Нет',
                            style: TextStyle(
                                fontSize: fontSize3, color: colors[2])),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(() => ListerController.clearStats());
                        Navigator.of(context).pop(false);
                      },
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        overlayColor: MaterialStateProperty.all<Color>(
                            colors[2]!.withOpacity(0.1)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('Да',
                            style: TextStyle(
                                fontSize: fontSize3, color: colors[2])),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
      });
}
