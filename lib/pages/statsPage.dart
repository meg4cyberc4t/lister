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
      appBar: AppBar(
        title: Text(
          'Статистика',
          style: TextStyle(fontSize: fontSize2),
        ),
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
                    legendTextStyle: TextStyle(fontFamily: fontFamily)),
                colorList: [
                  currentThemeLight ? Color(0xFF46CF68) : Color(0xFF34C759),
                  currentThemeLight ? Color(0xFFFF534A) : Color(0xFFFF3B30),
                  currentThemeLight ? Color(0xFFEFEF86) : Color(0xFFD1D1D6),
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
              ),
              Text(
                (ListerController.doneToDoCounter +
                        ListerController.deletedToDoCounter +
                        ListerController.length)
                    .toString(),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
