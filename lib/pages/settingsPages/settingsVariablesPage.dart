import 'package:flutter/material.dart';
import 'package:lister/components/ElevatedFloatingActionButton.dart';
import 'package:lister/components/FolderTitle.dart';
import 'package:lister/components/MyTextField.dart';
import 'package:lister/variables.dart';

class SettingsVariablesPage extends StatelessWidget {
  const SettingsVariablesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Color colors[1] = Color(0xff212121); // activeColorPrimary
    // TextEditingController __textEditingController =
    //     TextEditingController(text: colors[1].value.toRadixString(16));
    return Scaffold(
      backgroundColor: colors[1],
      appBar: AppBar(
        title: Text(
          'Настройки переменных',
          style: TextStyle(fontSize: fontSize2),
        ),
        centerTitle: true,
        backgroundColor: colors[0],
      ),
      body: ListView.builder(
        itemCount: colors.length + 1,
        itemBuilder: (context, index) {
          if (index < colors.length) {
            return ColorsTableSettings(index: index);
          } else {
            return Column(
              children: [
                FolderTitle(title: ''),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedFloatingActionButton(
                      title: 'Сбросить всё',
                      onPressed: () => globalSetState(() {
                        colors = defaultColors;
                      }),
                      onLongPress: () {},
                    )
                  ],
                ),
                SizedBox(height: 10),
              ],
            );
          }
        },
      ),
    );
  }
}

class ColorsTableSettings extends StatelessWidget {
  const ColorsTableSettings({
    Key? key,
    this.index,
  }) : super(key: key);
  final index;

  @override
  Widget build(BuildContext context) {
    String valueRadix = colors[index]!.value.toRadixString(16);
    TextEditingController __textEditingController =
        TextEditingController(text: valueRadix);
    Widget textBox = Container();
    if (0 <= index && index <= colors.length) {
      String text = '';
      switch (index) {
        case 0:
          text = 'Кнопка и панель';
          break;
        case 1:
          text = 'Фоны';
          break;
        case 2:
          text = 'Буковки и не только (везде белый был)';
          break;
        case 3:
          text = 'Иконки и надпись в панели снизу';
          break;
        case 4:
          text = 'Удаление';
          break;
        case 5:
          text = 'Активные задачи';
          break;
        case 6:
          text = 'Выполнение';
          break;
      }
      textBox = Text(text, style: TextStyle(color: colors[2]));
    }
    return Container(
      child: Column(
        children: [
          FolderTitle(title: 'colors[$index]'),
          textBox,
          SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextField(
              textEditingController: __textEditingController,
              labeltext: null,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedFloatingActionButton(
                  title: 'Принять',
                  onPressed: () {
                    globalSetState(() => colors[index] = Color(
                        int.parse(__textEditingController.text, radix: 16)));
                  },
                  onLongPress: () {}),
              SizedBox(width: 10),
              ElevatedFloatingActionButton(
                  title: 'Пример',
                  onPressed: () {},
                  onLongPress: () {},
                  color: Color(
                      int.parse(__textEditingController.text, radix: 16))),
              SizedBox(width: 10),
              ElevatedFloatingActionButton(
                  title: 'Сбросить',
                  onPressed: () => globalSetState(
                      () => colors[index] = defaultColors[index] ?? Color(0)),
                  onLongPress: () {}),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
