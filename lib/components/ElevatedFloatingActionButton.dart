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
          primary: (currentThemeLight
              ? defaultLightColors[0]!
              : defaultDarkColors[0]!),
        ),
        onPressed: () => onPressed(),
        onLongPress: () => onLongPress(),
        child: Container(
          width: 110,
          height: 50,
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: defaultDarkColors[2]!,
                fontSize: fontSize3,
              ),
            ),
          ),
        ));
  }
}
