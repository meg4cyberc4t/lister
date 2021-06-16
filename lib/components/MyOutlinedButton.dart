import 'package:flutter/material.dart';
import 'package:lister/variables.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    Key? key,
    required this.title,
    required this.submitFunction,
  }) : super(key: key);

  final Function submitFunction;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => submitFunction(),
      style: ButtonStyle(
        alignment: Alignment.center,
        overlayColor: MaterialStateProperty.all<Color>(
            (currentThemeLight ? Color(0xFF212121) : Color(0xFFFFFFFF))
                .withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(title,
            style: TextStyle(
                fontSize: fontSize3,
                color:
                    currentThemeLight ? Color(0xFF212121) : Color(0xFFFFFFFF))),
      ),
    );
  }
}
