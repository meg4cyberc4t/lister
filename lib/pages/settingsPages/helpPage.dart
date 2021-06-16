import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:lister/variables.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Поддержка / Обратная связь',
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
                    """В случае возникновения ошибки или идей по улучшению приложения, обращайтесь по адресу:""",
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () => launch('mailto:listerApp@yandex.com'),
                    child: Text('listerApp@yandex.com'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
