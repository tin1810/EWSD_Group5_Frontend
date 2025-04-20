import 'package:hive/hive.dart';
import 'package:university_magazine_project/hive/hive_constants.dart';
part 'user_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_USER_VO, adapterName: USER_VO_ADAPTER)
class UserVO {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String? role;
  @HiveField(4)
  String? status;
  @HiveField(5)
  String? facultyId;
  @HiveField(6)
  String? id;
  @HiveField(7)
  bool? isLoggedIn;

  UserVO({
    this.name,
    this.email,
    this.password,
    this.role,
    this.status,
    this.facultyId,
    this.id,
    this.isLoggedIn,
  });
}
