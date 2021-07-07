import 'package:flutter/material.dart';
import 'package:lister/variables.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.onLongPress,
    this.buttonStyle,
    this.focusNode,
    this.autofocus = false,
    Clip clipBehavior = Clip.none,
    this.textStyle,
    this.clipBehavor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final String title;
  final ButtonStyle? buttonStyle;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip? clipBehavor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: OutlinedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavor ?? Clip.none,
        style: buttonStyle ??
            ButtonStyle(
              alignment: Alignment.center,
              overlayColor: MaterialStateProperty.all<Color>((currentThemeLight
                      ? defaultLightColors[2]!
                      : defaultDarkColors[2]!)
                  .withOpacity(0.1)),
            ),
        child: Text(title,
            style: textStyle ??
                TextStyle(
                    fontSize: fontSize2,
                    color: currentThemeLight
                        ? defaultLightColors[2]!
                        : defaultDarkColors[2]!)),
      ),
    );
  }
}
