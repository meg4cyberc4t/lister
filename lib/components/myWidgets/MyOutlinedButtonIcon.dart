import 'package:flutter/material.dart';
import 'package:lister/variables.dart';

class MyOutlinedButtonIcon extends StatelessWidget {
  const MyOutlinedButtonIcon({
    Key? key,
    required this.icon,
    this.iconColor,
    this.active = true,
    this.onPressed,
    this.onLongPress,
    this.buttonStyle,
    this.focusNode,
    this.autofocus,
    this.clipBehavor,
  }) : super(key: key);

  final icon;
  final bool? iconColor;
  final bool active;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ButtonStyle? buttonStyle;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Clip? clipBehavor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: OutlinedButton(
          onPressed: onPressed ?? () {},
          onLongPress: onLongPress ?? () {},
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: active
                ? MaterialStateProperty.all(currentThemeLight
                    ? defaultDarkColors[1]
                    : defaultLightColors[1])
                : null,
            overlayColor: MaterialStateProperty.all<Color>((currentThemeLight
                    ? defaultLightColors[2]!
                    : defaultDarkColors[2]!)
                .withOpacity(0.1)),
          ),
          child: Icon(
            icon,
            color: iconColor ?? active
                ? currentThemeLight
                    ? defaultDarkColors[2]!
                    : defaultLightColors[2]!
                : currentThemeLight
                    ? defaultLightColors[2]!
                    : defaultDarkColors[2]!,
          )),
    );
  }
}
