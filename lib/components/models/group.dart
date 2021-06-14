import 'dart:ui';
import 'package:hive/hive.dart';

part 'group.g.dart';

@HiveType(adapterName: 'Group', typeId: 1)
class Group extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  Color color;
  @HiveField(3)
  List<int> children;
  Group(
      {required this.id,
      required this.title,
      required this.color,
      required this.children});
}
