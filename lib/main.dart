import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lister/ErrorIndicator.dart';
import 'package:lister/LoadingIndicator.dart';
import 'package:lister/controller.dart';
import 'package:lister/momentPage.dart';
import 'package:lister/variables.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Lister()));
}

class Lister extends StatefulWidget {
  @override
  _ListerState createState() => _ListerState();
}

class _ListerState extends State<Lister> {
  PageController mainPageViewController = PageController(initialPage: 1);
  PersistentTabController _persistentTabController =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [MomentPage(), LoadingIndicator()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PersistentTabView(
        context,
        controller: _persistentTabController,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
      ),
      body: FutureBuilder(
          future: ListerController.initialize(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return ErrorIndicator(snapshot: snapshot);
            } else if (snapshot.hasData) {
              return MomentPage();
            } else {
              return LoadingIndicator();
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                TextEditingController controller = TextEditingController();
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0.0,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Создание',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: FontSize1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            onSubmitted: (String text) {
                              if (text.isNotEmpty) {
                                ListerController.add(title: text);
                                super.setState(() {});
                                Navigator.of(context).pop(false);
                              }
                            },
                            autocorrect: true,
                            controller: controller,
                            autofocus: true,
                            maxLines: 1,
                            minLines: 1,
                            textAlign: TextAlign.center,
                            obscureText: false,
                            style: TextStyle(fontSize: FontSize2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextButton(
                            onPressed: () {
                              if (controller.text.isNotEmpty) {
                                ListerController.add(
                                  title: controller.text,
                                );
                                super.setState(() {});
                                Navigator.of(context).pop(false);
                              }
                            },
                            onLongPress: () {
                              if (controller.text.isNotEmpty) {
                                for (var i = 0; i < 100; i++) {
                                  ListerController.add(
                                    title: i.toString(),
                                    // title: controller.text,
                                  );
                                }
                                super.setState(() {});
                                Navigator.of(context).pop(false);
                              }
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(25, 10, 25, 10),
                              child: Text(
                                'Продолжить',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: FontSize2),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
