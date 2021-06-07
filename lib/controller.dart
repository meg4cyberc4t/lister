import 'package:hive/hive.dart';
import 'package:lister/variables.dart';

class ListerController {
  static List mainList = [];
  static dynamic storage;
  static int deletedToDoCounter = 0;
  static int doneToDoCounter = 0;

  static Future<dynamic> initialize() async {
    storage = await Hive.openBox(ToDoDatabaseName);
    mainList = storage.get('mainList') ?? [];
    deletedToDoCounter = storage.get('deletedToDoCounter') ?? 0;
    doneToDoCounter = storage.get('doneToDoCounter') ?? 0;
    return 0;
  }

  static void deletedToDoCounterAdd() {
    deletedToDoCounter++;
    storage.put('deletedToDoCounter', deletedToDoCounter);
  }

  static void doneToDoCounterAdd() {
    doneToDoCounter++;
    storage.put('doneToDoCounter', doneToDoCounter);
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
