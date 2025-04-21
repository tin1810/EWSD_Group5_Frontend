// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deadline_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeadlineVOAdapter extends TypeAdapter<DeadlineVO> {
  @override
  final int typeId = 5;

  @override
  DeadlineVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeadlineVO(
      firstFinalDate: fields[0] as String?,
      secondFinalDate: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DeadlineVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.firstFinalDate)
      ..writeByte(1)
      ..write(obj.secondFinalDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeadlineVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
