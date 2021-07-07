import 'package:flutter/material.dart';
import 'package:lister/variables.dart';

class ElevatedFloatingActionButton extends StatelessWidget {
  const ElevatedFloatingActionButton({
    Key? key,
    this.color,
    required this.title,
    this.onLongPress,
    this.onPressed,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    Widget? child,
  }) : super(key: key);
  final String title;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Colors? color;
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
        onPressed: onPressed ?? () {},
        onLongPress: onLongPress ?? () {},
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
