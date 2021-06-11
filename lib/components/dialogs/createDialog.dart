import 'package:flutter/material.dart';
import 'package:lister/components/MyTextField.dart';
import 'package:lister/components/controller.dart';
import 'package:lister/variables.dart';

Future<dynamic> createAdderDialog(BuildContext context, setState) {
  return showDialog(
      context: context,
      builder: (context) {
        TextEditingController _textEditingController = TextEditingController();
        Function submitFunction = () {
          String text = _textEditingController.text.trim();
          if (text.isNotEmpty) {
            ListerController.add(text);
            setState(() {});
            Navigator.of(context).pop(false);
          } else {
            // SnackBar(content: Snack)
            _textEditingController.text = '';
          }
        };
        return Dialog(
            child: Container(
          padding: EdgeInsets.all(1),
          child: Container(
            color: colors[1],
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Создание',
                    style: TextStyle(
                      fontSize: fontSize2,
                      color: colors[2],
                    )),
                SizedBox(height: 10),
                MyTextField(
                  labeltext: 'Название задачи',
                  textEditingController: _textEditingController,
                  onSubmitted: submitFunction,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStateProperty.all<Color>(
                            colors[0] ?? Color(0)),
                        overlayColor: MaterialStateProperty.all<Color>(
                            colors[2]!.withOpacity(0.1)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Назад',
                            style: TextStyle(
                                fontSize: fontSize3, color: colors[2])),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () => submitFunction(),
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStateProperty.all<Color>(
                            colors[0] ?? Color(0)),
                        overlayColor: MaterialStateProperty.all<Color>(
                            colors[2]!.withOpacity(0.1)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Далее',
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
