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
  Note({required this.title, required this.id, required this.createTime});
}
