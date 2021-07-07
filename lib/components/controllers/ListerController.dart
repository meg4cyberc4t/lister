import 'package:hive/hive.dart';
import 'package:lister/components/models/subtask.dart';
import 'package:lister/variables.dart';
import '../models/counters.dart';
import '../models/note.dart';

class ListerController {
  static List<dynamic> mainList = []; // Groups and notes without group;
  static dynamic storage;
  static var counters = Counters();
  static Map databaseNotes = {};

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
    String? description,
    DateTime? deadline,
    List? subtasks,
  }) {
    int id = counters.lastNoteId++;
    List newSubtasks = [];
    int lastIdSubtasks = 0;
    for (var titleSubtask in subtasks!) {
      newSubtasks.add(Subtask(
        title: titleSubtask.trim(),
        id: lastIdSubtasks,
        check: false,
      ));
      lastIdSubtasks += 1;
    }
    databaseNotes[id] = Note(
      id: id,
      title: title,
      createTime: createTime,
      description: description,
      deadline: deadline,
      subtasks: newSubtasks,
    );
    mainList.add(id);
    storage.put('mainList', mainList);
    storage.put('databaseNotes', databaseNotes);
    storage.put('counters', counters);
  }

  static void editNote({
    required int id,
    String? newTitle,
    int? groupId,
    String? newDescription,
    List<String>? newSubtasks,
    DateTime? newDeadline,
  }) {
    databaseNotes[id] = Note(
      id: id,
      title: newTitle ?? databaseNotes[id]!.title,
      createTime: databaseNotes[id]!.createTime,
      description: newDescription ?? databaseNotes[id]!.description,
      subtasks: newSubtasks ?? databaseNotes[id]!.subtasks,
      deadline: newDeadline ?? databaseNotes[id]!.deadline,
      lastSubtaskId: databaseNotes[id]!.lastSubtaskId,
    );
    storage.put('databaseNotes', databaseNotes);
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
