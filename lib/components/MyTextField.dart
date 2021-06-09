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
    return TextField(
      autocorrect: true,
      autofocus: true,
      controller: _textEditingController,
      onSubmitted: (value) => onSubmitted(),
      cursorColor: setTextColor,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: setTextColor),
          labelText: labeltext,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            style: BorderStyle.solid,
            color: setTextColor,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            style: BorderStyle.solid,
            color: setTextColor,
          )),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            style: BorderStyle.solid,
            color: setTextColor,
          ))),
      style: TextStyle(
        color: setTextColor,
        fontSize: 20,
      ),
    );
  }
}
