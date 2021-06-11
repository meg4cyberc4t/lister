import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lister/components/Dialogs/correctionDialog.dart';
import 'package:lister/components/ElevatedFloatingActionButton.dart';
import 'package:lister/components/controller.dart';
import 'package:lister/variables.dart';
import 'package:pie_chart/pie_chart.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[1],
      appBar: AppBar(
        title: Text(
          'Статистика',
          style: TextStyle(fontSize: fontSize2),
        ),
        backgroundColor: colors[0],
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ElevatedFloatingActionButton(
          title: 'Обновить',
          onPressed: () => setState(() {}),
          onLongPress: () {
            correctionDialog(context: context, setState: setState);
          }),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              PieChart(
                dataMap: {
                  'Сделанные - ${ListerController.doneToDoCounter}':
                      ListerController.doneToDoCounter.toDouble(),
                  'Удалённые - ${ListerController.deletedToDoCounter}':
                      ListerController.deletedToDoCounter.toDouble(),
                  'В данный момент - ${ListerController.length}':
                      ListerController.length.toDouble(),
                },
                animationDuration: Duration(seconds: 1),
                centerText: 'Задачи',
                chartRadius: (MediaQuery.of(context).size.width < 400)
                    ? MediaQuery.of(context).size.width / 1.3
                    : 400 / 1.3,
                initialAngleInDegree: 0,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.bottom,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    color: colors[2],
                  ),
                ),
                colorList: [
                  colors[6] ?? Color(0),
                  colors[4] ?? Color(0),
                  colors[5] ?? Color(0),
                ],
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Всего задач:',
                style: TextStyle(
                  color: colors[2],
                ),
              ),
              Text(
                (ListerController.doneToDoCounter +
                        ListerController.deletedToDoCounter +
                        ListerController.length)
                    .toString(),
                style: TextStyle(
                  color: colors[2],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
