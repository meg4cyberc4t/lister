import 'package:flutter/material.dart';

class MaterialButtonSettings extends StatelessWidget {
  MaterialButtonSettings({
    Key? key,
    required this.title,
    this.onPressed,
    this.onLongPress,
  }) : super(key: key);
  final title, onPressed, onLongPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (onPressed == null) ? null : () => onPressed(),
      onLongPress: (onLongPress == null) ? null : () => onLongPress(),
      child: Container(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.zero,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    title,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width < 400
                            ? MediaQuery.of(context).size.width / 16
                            : 400 / 16),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Divider(height: 1),
            ),
          ],
        ),
      ),
    );
  }
}
