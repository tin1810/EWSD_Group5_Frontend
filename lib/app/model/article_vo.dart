import 'dart:typed_data';
import 'package:hive/hive.dart';
import 'package:university_magazine_project/app/model/comment_vo.dart';
import 'package:university_magazine_project/hive/hive_constants.dart';
part 'article_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_ARTICLE_VO, adapterName: ARTICLE_VO_ADAPTER)
class ArticleVO {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? studentId;
  @HiveField(2)
  String? facultyId;
  @HiveField(3)
  String? title;
  @HiveField(4)
  Uint8List? wordBytes;
  @HiveField(5)
  Uint8List? imgBytes;
  @HiveField(6)
  CommentVO? comment;
  @HiveField(7)
  String? date;
  @HiveField(8)
  bool? isSelected;
  @HiveField(9)
  bool? isPublished;

  ArticleVO({
    this.id,
    this.studentId,
    this.facultyId,
    this.title,
    this.wordBytes,
    this.imgBytes,
    this.date,
    this.comment,
    this.isSelected,
    this.isPublished,
  });
}
