import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(adapterName: 'Note', typeId: 3)
class Note extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  final int id;
  @HiveField(2)
  DateTime createTime;
  @HiveField(3)
  String? description;
  @HiveField(4)
  List subtasks;
  @HiveField(5)
  int lastSubtaskId = 0;
  @HiveField(6)
  DateTime? deadline;

  Note({
    required this.title,
    required this.id,
    required this.createTime,
    this.deadline,
    this.description,
    this.subtasks = const [],
    this.lastSubtaskId = 0,
  });
}
