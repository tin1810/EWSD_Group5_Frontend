import 'package:hive/hive.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/hive_constants.dart';

mixin UserDao {
  /// Persistence

  void saveUser(UserVO? user) async {
    await getUserBox().put(user?.id, user!);
  }

  void deleteUser(String? id) async {
    await getUserBox().delete(id);
  }

  void clearUsers() async {
    await getUserBox().clear();
  }

  List<UserVO?>? getAllUsers() {
    return getUserBox().values.toList();
  }

  /// Reactive
  Stream<void> getAllUserEventStream() {
    return getUserBox().watch();
  }

  Stream<List<UserVO?>?> getAllUsersStream() {
    return Stream.value(getAllUsers());
  }

  /// Box
  Box<UserVO> getUserBox() {
    return Hive.box<UserVO>(BOX_NAME_USER_VO);
  }
}
