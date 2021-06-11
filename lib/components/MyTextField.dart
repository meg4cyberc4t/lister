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
      color: colors[2] ?? Color(0),
    );
    return TextField(
      autocorrect: true,
      autofocus: true,
      controller: _textEditingController,
      onSubmitted: (value) => onSubmitted(),
      cursorColor: colors[2],
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: colors[2]),
          labelText: labeltext,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            style: BorderStyle.solid,
            color: colors[2] ?? Color(0),
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            style: BorderStyle.solid,
            color: colors[2] ?? Color(0),
          )),
          border: OutlineInputBorder(borderSide: borderSide2)),
      style: TextStyle(
        color: colors[2],
        fontSize: 20,
      ),
    );
  }
}
