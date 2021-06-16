import 'package:flutter/material.dart';
import 'package:lister/variables.dart';

class ElevatedFloatingActionButton extends StatelessWidget {
  const ElevatedFloatingActionButton({
    Key? key,
    required this.title,
    this.color,
    required this.onPressed,
    required this.onLongPress,
  }) : super(key: key);
  final title, color, onPressed, onLongPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          animationDuration: Duration(seconds: 1),
          primary: (currentThemeLight ? Color(0xFF474747) : Color(0xFF212121)),
        ),
        onPressed: () => onPressed(),
        onLongPress: () => onLongPress(),
        child: Container(
          width: 110,
          height: 50,
          padding: const EdgeInsets.all(15.0),
          child: Center(
              child: Text(
            title,
            style: TextStyle(color: Color(0xFFFFFFFF)),
          )),
        ));
  }
}
