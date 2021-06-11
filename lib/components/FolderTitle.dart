import 'package:flutter/material.dart';
import 'package:lister/variables.dart';

class FolderTitle extends StatelessWidget {
  const FolderTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                height: 1,
                color: colors[2],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                title,
                style: TextStyle(color: colors[2], fontSize: 20),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                height: 1,
                color: colors[2],
              ),
            ),
          ],
        ),
      ),
    );
  }
}