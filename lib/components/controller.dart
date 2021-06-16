import 'dart:ui';
import 'package:hive/hive.dart';
import 'package:lister/variables.dart';
// import 'models/counters.dart';
// import 'models/counters.g.dart';
import 'models/counters.dart';
import 'models/group.dart';
// import 'models/group.g.dart';
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
    databaseGroups = storage.get('databaseGroup') ?? {};
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

  static void addNote({required String title, int? groupId}) {
    int id = counters.lastNoteId++;
    databaseNotes[id] = Note(id: id, title: title, groupId: groupId);
    mainList.add(id);
    storage.put('mainList', mainList);
    storage.put('databaseNotes', databaseNotes);
  }

  static void editNote({required int id, String? newTitle, int? groupId}) {
    var databaseNotes2 = databaseNotes;
    if (groupId != null) {
      databaseGroups[databaseNotes[id]!.groupId]!.children.remove(id);
      databaseGroups[groupId]!.children.add(id);
    }
    databaseNotes[id] = Note(
        id: id, title: newTitle ?? databaseNotes2[id]!.title, groupId: groupId);
    storage.put('databaseNotes', databaseNotes);
    storage.put('databaseGroups', databaseGroups);
  }

  static void removeNote(int id) {
    if (databaseNotes[id]?.groupId != null) {
      databaseGroups[databaseNotes[id]!.groupId]!.children.remove(id);
      storage.put('databaseGroups', databaseGroups);
    }
    mainList.remove(id);
    databaseNotes.remove(id);
    storage.put('databaseNotes', databaseNotes);
    storage.put('mainList', mainList);
  }

  static void addGroup(
      {required String title,
      required Color color,
      required List<int> children}) {
    int id = -(counters.lastGroupId++);
    databaseGroups[id] =
        Group(id: id, title: title, color: color, children: children);
    mainList.add(id);
    children.forEach((element) => mainList.remove(element));
    storage.put('mainList', mainList);
    storage.put('databaseGroups', databaseGroups);
  }

  static void editGroup(
      {required int id, String? title, Color? color, List<int>? children}) {
    databaseGroups[id] = Group(
        id: id,
        title: title ?? databaseGroups[id]!.title,
        color: color ?? databaseGroups[id]!.color,
        children: children ?? databaseGroups[id]!.children);
    storage.put('databaseGroups', databaseGroups);
  }

  static void removeGroup(id) {
    mainList.addAll(databaseGroups[id]!.children);
    mainList.remove(id);
    databaseGroups.remove(id);
    storage.put('mainList', mainList);
    storage.put('databaseGroups', databaseGroups);
  }

  static int get length => mainList.length;

  static void clearStats() {
    counters.deletedNotes = 0;
    counters.doneNotes = 0;
    storage.put('counters', counters);
  }

  static int get lengthAll {
    int c = 0;
    for (var elem in mainList) {
      if (elem < 0) {
        databaseGroups[elem]!.children.forEach((element) => c++);
      } else {
        c++;
      }
    }
    return c;
  }
}
