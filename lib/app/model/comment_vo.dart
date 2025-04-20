import 'package:hive/hive.dart';
import 'package:university_magazine_project/hive/hive_constants.dart';
part 'comment_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_COMMENT_VO, adapterName: COMMENT_VO_ADAPTER)
class CommentVO {
  @HiveField(0)
  String? comment;
  @HiveField(1)
  String? coordinatorName;

  CommentVO({this.comment, this.coordinatorName});
}
