// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counters.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountersAdapter extends TypeAdapter<Counters> {
  @override
  final int typeId = 2;

  @override
  Counters read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Counters(
      deletedNotes: fields[0] as int,
      doneNotes: fields[1] as int,
      lastGroupId: fields[2] as int,
      lastNoteId: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Counters obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.deletedNotes)
      ..writeByte(1)
      ..write(obj.doneNotes)
      ..writeByte(2)
      ..write(obj.lastGroupId)
      ..writeByte(3)
      ..write(obj.lastNoteId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Counters &&
          runtimeType == other.runtimeType &&
          typeId == this.typeId;
}
