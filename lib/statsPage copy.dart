import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  int counter = 0;

  bool startAnimation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: InkWell(
      onTap: () => setState(() => startAnimation = !startAnimation),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: startAnimation ? Colors.lightGreen : Colors.red,
          borderRadius: BorderRadius.circular(startAnimation ? 15.0 : 0.0),
        ),
        height: startAnimation ? 100 : 0,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 500),
      ),
    )));
  }
}
