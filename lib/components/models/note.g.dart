// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final int typeId = 3;

  @override
  Note read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Note(
      title: fields[0] as String,
      id: fields[1] as int,
      createTime: fields[2] as DateTime,
      deadline: fields[6] as DateTime?,
      description: fields[3] as String?,
      subtasks: (fields[4] as List).cast<dynamic>(),
      lastSubtaskId: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.createTime)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.subtasks)
      ..writeByte(5)
      ..write(obj.lastSubtaskId)
      ..writeByte(6)
      ..write(obj.deadline);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Note &&
          runtimeType == other.runtimeType &&
          typeId == this.typeId;
}
