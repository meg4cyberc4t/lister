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
      color: currentThemeLight ? Color(0xFF212121) : Color(0xFFFFFFFF),
    );
    return TextField(
      autocorrect: true,
      autofocus: true,
      controller: _textEditingController,
      onSubmitted: (value) => onSubmitted(),
      cursorColor: currentThemeLight ? Color(0xFF212121) : Color(0xFFFFFFFF),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          labelStyle: TextStyle(
              color: currentThemeLight ? Color(0xFF212121) : Color(0xFFFFFFFF)),
          labelText: labeltext,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            style: BorderStyle.solid,
            color: currentThemeLight ? Color(0xFF212121) : Color(0xFFFFFFFF),
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            style: BorderStyle.solid,
            color: currentThemeLight ? Color(0xFF212121) : Color(0xFFFFFFFF),
          )),
          border: OutlineInputBorder(borderSide: borderSide2)),
      style: TextStyle(
        color: currentThemeLight ? Color(0xFF212121) : Color(0xFFFFFFFF),
        fontSize: 20,
      ),
    );
  }
}
