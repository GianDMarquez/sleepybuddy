// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journalEntry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class journalEntryAdapter extends TypeAdapter<journalEntry> {
  @override
  final int typeId = 0;

  @override
  journalEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return journalEntry(
      entryID: fields[0] as int,
      createdDate: fields[1] as DateTime,
      title: fields[2] as String,
      content: fields[3] as String,
      lastEditedDate: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, journalEntry obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.entryID)
      ..writeByte(1)
      ..write(obj.createdDate)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.content)
      ..writeByte(4)
      ..write(obj.lastEditedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is journalEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
