import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lister/variables.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required TextEditingController textEditingController,
    required this.labeltext,
    this.onSubmitted,
  })  : _textEditingController = textEditingController,
        super(key: key);

  final TextEditingController _textEditingController;
  final labeltext;
  final onSubmitted;

  @override
  Widget build(BuildContext context) {
    var borderSide2 = BorderSide(
      style: BorderStyle.solid,
      color: currentThemeLight ? defaultLightColors[2]! : defaultDarkColors[2]!,
    );
    return TextField(
      autocorrect: true,
      autofocus: true,
      controller: _textEditingController,
      onSubmitted: (value) => onSubmitted(),
      cursorColor:
          currentThemeLight ? defaultLightColors[2]! : defaultDarkColors[2]!,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          labelStyle: TextStyle(
            color: currentThemeLight
                ? defaultLightColors[2]!
                : defaultDarkColors[2]!,
            fontSize: fontSize2,
          ),
          labelText: labeltext,
          hintText: getOriginalHint(),
          hintStyle: TextStyle(fontSize: fontSize2),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            style: BorderStyle.solid,
            color: currentThemeLight
                ? defaultLightColors[2]!
                : defaultDarkColors[2]!,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            style: BorderStyle.solid,
            color: currentThemeLight
                ? defaultLightColors[2]!
                : defaultDarkColors[2]!,
          )),
          border: OutlineInputBorder(borderSide: borderSide2)),
      style: TextStyle(
        color:
            currentThemeLight ? defaultLightColors[2]! : defaultDarkColors[2]!,
        fontSize: fontSize2,
      ),
    );
  }
}

String getOriginalHint() {
  List allHints = [
    'Помыть посуду',
    'Сходить в магазин',
    'Сделать отчёт',
    'Выполнить план',
    'Прочитать книгу',
    'Купить оливки',
    'Попить воды',
    'Попрактиковаться',
    'Позаниматься спортом',
    '╰(*°▽°*)╯',
  ];
  return allHints[new Random().nextInt(allHints.length)];
}
