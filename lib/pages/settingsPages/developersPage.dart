import 'package:flutter/material.dart';
import 'package:lister/variables.dart';

class DevelopersPage extends StatelessWidget {
  const DevelopersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Разработчики',
          style: TextStyle(fontSize: fontSize1),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Lister - Смахни свои дела",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: fontSize2),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Программирование:\nИгорь Молчанов",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: fontSize2),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Дизайн:\nАлиса Матросова\nДарья Морозова',
                    style: TextStyle(fontSize: fontSize2),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Тестирование:\nМарат Геворкян",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: fontSize2),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
