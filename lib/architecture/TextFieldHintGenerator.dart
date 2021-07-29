import 'dart:math';

class TextFieldHintGenerator {
  static String get generate => allHints[new Random().nextInt(allHints.length)];

  static const List allHints = [
    'Помыть посуду',
    'Сходить в магазин',
    'Сделать отчёт',
    'Выполнить план',
    'Прочитать книгу',
    'Купить оливки',
    'Попить воды',
    'Попрактиковаться',
    'Позаниматься спортом',
  ];
}
