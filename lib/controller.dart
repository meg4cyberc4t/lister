import 'package:hive/hive.dart';
import 'package:lister/variables.dart';

class ListerController {
  static List mainList = [];
  static dynamic storage;

  static Future<dynamic> initialize() async {
    storage = await Hive.openBox(ToDoDatabaseName);
    mainList = storage.get('mainList') ?? [];
    return 0;
  }

  static void add(String title) {
    ListerController.mainList.add(title);
    storage.put('mainList', mainList);
  }

  static void remove(String title) {
    ListerController.mainList.remove(title);
    storage.put('mainList', mainList);
  }

  static String getter(position) => mainList[position];

  static int get length => mainList.length;
}
