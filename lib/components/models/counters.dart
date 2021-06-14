import 'package:hive/hive.dart';

part 'counters.g.dart';

@HiveType(adapterName: 'Counters', typeId: 2)
class Counters extends HiveObject {
  @HiveField(0)
  int deletedNotes;
  @HiveField(1)
  int doneNotes;
  @HiveField(2)
  int lastGroupId;
  @HiveField(3)
  int lastNoteId;
  Counters(
      {this.deletedNotes = 0,
      this.doneNotes = 0,
      this.lastGroupId = 0,
      this.lastNoteId = 0});
}
