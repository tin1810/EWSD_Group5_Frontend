import 'package:get/get.dart';
import 'package:university_magazine_project/app/model/user_model.dart';

class AdminController extends GetxController {
  var submissionDeadline = ''.obs;
  var finalDeadline = ''.obs;
  var users = <User>[].obs;

  void setSubmissionDeadline(String date) {
    submissionDeadline.value = date;
  }

  void setFinalDeadline(String date) {
    finalDeadline.value = date;
  }

  void addUser(User user) {
    users.add(user);
  }

  void editUser(int index, User user) {
    users[index] = user;
  }

  void deleteUser(int index) {
    users.removeAt(index);
  }
}
