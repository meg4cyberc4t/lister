import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({
    Key? key,
    this.snapshot,
  }) : super(key: key);
  final snapshot;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              Icons.cancel_outlined,
              color: Colors.red,
              size: 60,
            ),
          ),
          Text(
            'Ошибка: ${snapshot.error}',
            textAlign: TextAlign.center,
          ),
          Text(
            'Свяжитесь с разработчиками для решения проблемы',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
