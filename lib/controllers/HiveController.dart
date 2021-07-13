import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lister/models/note.dart';

const String ToDoDatabaseName = 'ListerDatabase';
const String DatabasesPath = "~/.AppData/lister";

class HiveController {
  static dynamic storage;
  static Future<dynamic> initialize() async {
    await Hive.initFlutter(DatabasesPath);
    Hive.registerAdapter(NoteAdapter());
    storage = await Hive.openBox(ToDoDatabaseName);
    if (!storage.keys.contains('mainList')) storage.put('mainList', []);
    return 0;
  }

  static List getMainList() => storage.get('mainList');

  static saveMainList(List list) => storage.put('mainList', list);
}
