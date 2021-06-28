import 'package:flutter/material.dart';
import 'package:lister/variables.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';

class VersionPage extends StatefulWidget {
  const VersionPage({Key? key}) : super(key: key);

  @override
  _VersionPageState createState() => _VersionPageState();
}

class _VersionPageState extends State<VersionPage> {
  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Версия',
          style: TextStyle(fontSize: fontSize1),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getVersion(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Center(
              child: SingleChildScrollView(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Версия ${snapshot.data} от 22.06.2021',
                          style: TextStyle(fontSize: fontSize2),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Открытый исходный код по ссылке:',
                          style: TextStyle(fontSize: fontSize2),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                          onPressed: () =>
                              launch('https://github.com/meg4cyberc4t/lister'),
                          child: Text(
                            'https://github.com/meg4cyberc4t/lister',
                            style: TextStyle(fontSize: fontSize2),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
