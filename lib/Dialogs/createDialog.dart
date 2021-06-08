import 'package:flutter/material.dart';
import 'package:lister/components/MyTextField.dart';
import 'package:lister/controller.dart';
import 'package:lister/variables.dart';

Future<dynamic> createAdderDialog(BuildContext context, setState) {
  return showDialog(
      context: context,
      builder: (context) {
        TextEditingController _textEditingController = TextEditingController();
        return Dialog(
            child: Container(
          padding: EdgeInsets.all(2),
          child: Container(
            color: backgroundColor,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Создание',
                    style: TextStyle(
                      fontSize: appBarTextTitleSize,
                      color: setTextColor,
                    )),
                SizedBox(height: 10),
                MyTextField(
                    labeltext: 'Название задачи',
                    textEditingController: _textEditingController),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        overlayColor: MaterialStateProperty.all<Color>(
                            setTextColor.withOpacity(0.1)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('Назад',
                            style: TextStyle(
                                fontSize: OutlinedButtonTextSize,
                                color: setTextColor)),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        String text = _textEditingController.text.trim();
                        if (text.isNotEmpty) {
                          ListerController.add(text);
                          setState(() {});
                          Navigator.of(context).pop(false);
                        } else {
                          // SnackBar(content: Snack)
                          _textEditingController.text = '';
                        }
                      },
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        overlayColor: MaterialStateProperty.all<Color>(
                            setTextColor.withOpacity(0.1)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('Далее',
                            style: TextStyle(
                                fontSize: OutlinedButtonTextSize,
                                color: setTextColor)),
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
