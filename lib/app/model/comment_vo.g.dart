// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommentVOAdapter extends TypeAdapter<CommentVO> {
  @override
  final int typeId = 3;

  @override
  CommentVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommentVO(
      comment: fields[0] as String?,
      coordinatorName: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CommentVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.comment)
      ..writeByte(1)
      ..write(obj.coordinatorName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
