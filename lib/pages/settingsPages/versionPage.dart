import 'package:flutter/material.dart';
import 'package:lister/variables.dart';
import 'package:url_launcher/url_launcher.dart';

class VersionPage extends StatelessWidget {
  const VersionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Версия',
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
                  Text('Версия 1.0.0 от 14.06.2021'),
                  SizedBox(height: 20),
                  Text('Открытый исходный код по ссылке:'),
                  TextButton(
                    onPressed: () =>
                        launch('https://github.com/meg4cyberc4t/lister'),
                    child: Text('github.com/meg4cyberc4t/lister'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
