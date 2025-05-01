import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';

class LoginController extends GetxController with UserDao {
  var email = ''.obs;
  var password = ''.obs;
  List<UserVO?>? userList;

  @override
  void onInit() {
    userList = getAllUsers();
    super.onInit();
  }

  Future<String> onTapLogin() {
    try {
      var user = userList?.firstWhere((e) {
        return e?.email == email.value && e?.password == password.value;
      });
      user!.isLoggedIn = true;
      if (user.lastLoggedInDate == null) {
        Fluttertoast.showToast(msg: "Welcome ${user.name}");
      }
      user.lastLoggedInDate = DateTime.now().toString().substring(0, 10);
      saveUser(user);
      update();
      return Future.value(user.role ?? "");
    } catch (e) {
      return Future.error("Wrong Credentials!");
    }
  }
}
