import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(adapterName: 'Note', typeId: 0)
class Note extends HiveObject with EquatableMixin {
  @HiveField(0)
  String title;
  @HiveField(1)
  DateTime createTime;
  @HiveField(2)
  String description;
  @HiveField(3)
  List subtasks;
  @HiveField(4)
  DateTime? deadline;

  Note copyWith({
    String? title,
    DateTime? createTime,
    DateTime? deadline,
    String? description,
    List? subtasks,
    List? completedSubtasks,
    bool deadlineAvailable = false,
  }) {
    return Note(
      createTime: createTime ?? this.createTime,
      title: title ?? this.title,
      deadline: deadlineAvailable ? deadline : deadline ?? this.deadline,
      description: description ?? this.description,
      subtasks: subtasks ?? this.subtasks,
    );
  }

  Note({
    required this.title,
    required this.createTime,
    this.deadline,
    required this.description,
    this.subtasks = const [],
  });

  @override
  List<Object?> get props =>
      [createTime, title, deadline, description, subtasks];
}
