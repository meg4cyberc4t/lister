import 'package:hive/hive.dart';
import 'package:lister/variables.dart';

class ListerController {
  static List completedList = [];
  static List momentList = [];
  static List deferredList = [];
  static Map listInfo = {};
  static int lastId = 0;
  static dynamic storage;

  // status(0 - будущее, 1 - настоящее, 2 - выполненное)

  static Future<dynamic> initialize() async {
    storage = await Hive.openBox(ToDoDatabaseName);
    completedList = storage.get('completedList') ?? [];
    momentList = storage.get('momentList') ?? [];
    deferredList = storage.get('completedList') ?? [];
    listInfo = storage.get('listInfo') ?? {};
    lastId = storage.get('lastId') ?? 0;
    return 0;
  }

  static void add({
    required String title,
    required int status,
    required int time,
  }) {
    lastId += 1;
    setInfo(lastId, time, status, title);
    momentList.add(lastId);
    storage.put('lastId', lastId);
    storage.put('momentList', momentList);
  }

  static void move({
    required int position,
    required int id,
    required int status,
    required int lastStatus,
  }) {
    listInfo[id]['status'] = status;
    switch (lastStatus) {
      case 0:
        deferredList.removeAt(position);
        break;
      case 1:
        momentList.removeAt(position);
        break;
      case 2:
        completedList.removeAt(position);
        break;
    }
    switch (status) {
      case 0:
        deferredList.add(id);
        break;
      case 1:
        momentList.add(id);
        break;
      case 2:
        completedList.add(id);
        break;
    }
    storage.put('deferredList', deferredList);
    storage.put('momentList', momentList);
    storage.put('completedList', completedList);
  }

  static void setInfo(int id, int time, int status, String title) {
    listInfo[id] = {
      'title': title,
      'status': status,
      'time': time,
    };
    storage.put('listInfo', listInfo);
  }

  static int getTime(int id) {
    return listInfo[id]['time'];
  }

  static int getStatus(int id) {
    return listInfo[id]['time'];
  }

  static String getTitle(int id) {
    return listInfo[id]['title'];
  }
}
