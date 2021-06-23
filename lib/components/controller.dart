import 'package:hive/hive.dart';
import 'package:lister/variables.dart';
import 'models/counters.dart';
// import 'models/counters.g.dart';
import 'models/note.dart';
// import 'models/note.g.dart';

class ListerController {
  static List<dynamic> mainList = []; // Groups and notes without group;
  static dynamic storage;
  static var counters = Counters();
  static Map databaseNotes = {};
  static Map databaseGroups = {};

  static Future<dynamic> initialize() async {
    storage = await Hive.openBox(ToDoDatabaseName);
    mainList = storage.get('mainList') ?? [];
    databaseNotes = storage.get('databaseNotes') ?? {};
    counters = storage.get('counters') ?? Counters();
    return 0;
  }

  static void deleteNoteCounterAdd() {
    counters.deletedNotes++;
    storage.put('counters', counters);
  }

  static void doneNoteCounterAdd() {
    counters.doneNotes++;
    storage.put('counters', counters);
  }

  static void addNote({
    required String title,
    required DateTime createTime,
  }) {
    int id = counters.lastNoteId++;
    databaseNotes[id] = Note(id: id, title: title, createTime: createTime);
    mainList.add(id);
    storage.put('mainList', mainList);
    storage.put('databaseNotes', databaseNotes);
  }

  static void editNote({required int id, String? newTitle, int? groupId}) {
    databaseNotes[id] = Note(
        id: id,
        title: newTitle ?? databaseNotes[id]!.title,
        createTime: DateTime.now());
    storage.put('databaseNotes', databaseNotes);
    storage.put('databaseGroups', databaseGroups);
  }

  static void removeNote(int id) {
    mainList.remove(id);
    databaseNotes.remove(id);
    storage.put('databaseNotes', databaseNotes);
    storage.put('mainList', mainList);
  }

  static int get length => mainList.length;

  static void clearStats() {
    counters.deletedNotes = 0;
    counters.doneNotes = 0;
    storage.put('counters', counters);
  }
}
