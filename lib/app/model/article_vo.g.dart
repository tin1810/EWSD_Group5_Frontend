// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleVOAdapter extends TypeAdapter<ArticleVO> {
  @override
  final int typeId = 2;

  @override
  ArticleVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleVO(
      id: fields[0] as String?,
      studentId: fields[1] as String?,
      facultyId: fields[2] as String?,
      title: fields[3] as String?,
      wordBytes: fields[4] as Uint8List?,
      imgBytes: fields[5] as Uint8List?,
      date: fields[7] as String?,
      comment: fields[6] as CommentVO?,
      isSelected: fields[8] as bool?,
      isPublished: fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ArticleVO obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.studentId)
      ..writeByte(2)
      ..write(obj.facultyId)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.wordBytes)
      ..writeByte(5)
      ..write(obj.imgBytes)
      ..writeByte(6)
      ..write(obj.comment)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.isSelected)
      ..writeByte(9)
      ..write(obj.isPublished);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
