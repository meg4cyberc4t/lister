import 'package:hive/hive.dart';

part 'subtask.g.dart';

@HiveType(adapterName: 'Subtask', typeId: 4)
class Subtask extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  final int id;
  @HiveField(2)
  bool check;

  Subtask({
    required this.title,
    required this.id,
    required this.check,
  });
}
