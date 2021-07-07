import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lister/components/controllers/ListerController.dart';
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
      appBar: AppBar(
        title: Text(
          'Статистика',
          style: TextStyle(fontSize: fontSize1),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              PieChart(
                dataMap: {
                  'Сделанные - ${ListerController.counters.doneNotes}':
                      ListerController.counters.doneNotes.toDouble(),
                  'Удалённые - ${ListerController.counters.deletedNotes}':
                      ListerController.counters.deletedNotes.toDouble(),
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
                    showLegends: true,
                    legendPosition: LegendPosition.bottom,
                    legendShape: BoxShape.circle,
                    legendTextStyle: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: fontSize3,
                    )),
                colorList: [
                  currentThemeLight
                      ? defaultLightColors[6]!
                      : defaultDarkColors[6]!,
                  currentThemeLight
                      ? defaultLightColors[4]!
                      : defaultDarkColors[4]!,
                  currentThemeLight
                      ? defaultLightColors[5]!
                      : defaultDarkColors[5]!,
                ],
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  chartValueStyle:
                      TextStyle(fontSize: fontSize3, color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Всего задач:',
                style: TextStyle(fontSize: fontSize3),
              ),
              Text(
                (ListerController.counters.deletedNotes +
                        ListerController.counters.doneNotes +
                        ListerController.length)
                    .toString(),
                style: TextStyle(fontSize: fontSize3),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
