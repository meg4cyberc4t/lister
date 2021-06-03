import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 75,
        width: 75,
        child: RefreshProgressIndicator(
          strokeWidth: 4,
        ),
      ),
    );
  }
}
