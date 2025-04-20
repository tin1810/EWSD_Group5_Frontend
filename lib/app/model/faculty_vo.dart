import 'package:hive/hive.dart';
import 'package:university_magazine_project/hive/hive_constants.dart';
part 'faculty_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_FACULTY_VO, adapterName: FACULTY_VO_ADAPTER)
class FacultyVO {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? description;

  FacultyVO({
    this.name,
    this.id,
    this.description,
  });
}
