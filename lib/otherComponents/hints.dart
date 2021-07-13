import 'dart:math';

class Hint {
  static String get() => allHints[new Random().nextInt(allHints.length)];

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
