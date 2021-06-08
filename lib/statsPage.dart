import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lister/controller.dart';
import 'package:lister/variables.dart';
import 'package:pie_chart/pie_chart.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  // final data = [
  //   {
  //     ListerController.doneToDoCounter,
  //     ListerController.deletedToDoCounter,
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Статистика'),
        backgroundColor: activeColorPrimary,
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: activeColorPrimary,
          onPressed: () => setState(() {}),
          label: Text('Обновить')),
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
                chartRadius: (MediaQuery.of(context).size.width < 500)
                    ? MediaQuery.of(context).size.width / 1.3
                    : 500 / 1.3,
                initialAngleInDegree: 0,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.bottom,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                colorList: [
                  colorDones,
                  colorDeletes,
                  colorMoments,
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
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                (ListerController.doneToDoCounter +
                        ListerController.deletedToDoCounter +
                        ListerController.length)
                    .toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
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
