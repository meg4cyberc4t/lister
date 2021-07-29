import 'package:flutter/material.dart';
import 'package:lister/architecture/themeSettings.dart';

Future<String?> showTextEditDialog(
    BuildContext context, String title, String initialValue) {
  TextEditingController _textEditingController =
      TextEditingController(text: initialValue);
  return showGeneralDialog(
    context: context,
    transitionDuration: DataDuration,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curvedValue = 1.0 - Curves.ease.transform(animation.value);
      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
        child: Opacity(opacity: animation.value, child: child),
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) => Dialog(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: fontSize['MiniMiddle']),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _textEditingController,
                autocorrect: true,
                autofocus: true,
                textAlign: TextAlign.center,
                cursorWidth: 1,
                cursorColor: Theme.of(context).accentColor,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      child: Text(
                        'Отчистить',
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.pop(context, ' ');
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      child: Text(
                        'Далее',
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.pop(context, _textEditingController.text);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
