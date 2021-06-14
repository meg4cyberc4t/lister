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
          style: TextStyle(fontSize: fontSize2),
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
                    """Что же, я и не думал, что в этот раздел кто-то заглянет..\nЭто моё первое полноценное приложение, написанное на технологии Dart+Flutter. Знали бы вы, сколько пота и крови было пролито во время написании этого приложения... Если бы не мои друзья, оно могло и не выйти вовсе, кстати о них. Хочу передать огромную благодарность:
группе Conspectus, Алисе Матросовой за помощь с цветовой палитрой, а так же Марату Геворкяну и Валерию Шишову за удивительное посвящение в Dart. Уверен, мы ещё не раз встретимся, а пока - пока :)""",
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 20),
                  Text('Игорь Молчанов'),
                  Text('2021 год.'),
                ],
              )),
        ),
      ),
    );
  }
}
