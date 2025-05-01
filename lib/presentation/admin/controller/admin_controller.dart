import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/app/model/deadline_vo.dart';
import 'package:university_magazine_project/app/model/faculty_vo.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/deadline_dao.dart';
import 'package:university_magazine_project/hive/dao/faculty_dao.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';

enum AdminSection { system, users, faculty, logout }

enum RoleSection { Manager, Student, Coordinator, Admin }

class AdminController extends GetxController
    with FacultyDao, UserDao, DeadlineDao {
  var submissionDeadline = DateTime.now().add(Duration(days: 7)).obs;
  var finalDeadline = DateTime.now().add(Duration(days: 14)).obs;
  var selectedSection = AdminSection.system.obs;
  var faculties = <FacultyVO?>[].obs;
  var users = <UserVO?>[].obs;
  Rx<DeadlineVO?>? deadline;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController facultyController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController facultynameController = TextEditingController();
  final Rx<Uint8List?> profileImage = Rx<Uint8List?>(null);

  @override
  void onInit() {
    _fetchAllFac();
    _fetchAllUsers();
    var d = getDeadline();
    if (d != null) {
      submissionDeadline.value =
          DateTime.parse(getDeadline()?.firstFinalDate ?? "");
      finalDeadline.value =
          DateTime.parse(getDeadline()?.secondFinalDate ?? "");
    }
    super.onInit();
  }

  Stream<List<FacultyVO?>?> _getAllFacInStream() {
    return getAllFacultyEventStream()
        .startWith(getAllFacultyStream())
        .map((event) => getAllFaculty());
  }

  Stream<List<UserVO?>?> _getAllUsersInStream() {
    return getAllUserEventStream()
        .startWith(getAllUsersStream())
        .map((event) => getAllUsers());
  }

  void _fetchAllFac() async {
    _getAllFacInStream().listen((e) {
      faculties.value = e ?? [];
    });
  }

  void _fetchAllUsers() async {
    _getAllUsersInStream().listen((e) {
      users.value = e ?? [];
    });
  }

  void changeSection(AdminSection section) {
    selectedSection.value = section;
  }

  String formatDate(DateTime date) {
    return DateFormat('dd MMMM yyyy').format(date);
  }

  Future<void> selectDate(bool isSubmission) async {
    DateTime initialDate =
        isSubmission ? submissionDeadline.value : finalDeadline.value;
    DateTime firstDate = DateTime(2024);
    DateTime lastDate = DateTime(2030);

    DateTime? pickedDate = await Get.dialog<DateTime>(
      DatePickerDialog(
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
      ),
    );

    if (pickedDate != null) {
      if (isSubmission) {
        if (pickedDate.isAfter(finalDeadline.value)) {
          Get.snackbar(
            "Invalid Date",
            "Submission deadline cannot be after the final deadline",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          return;
        }
        submissionDeadline.value = pickedDate;
        DeadlineVO? deadline =
            DeadlineVO(firstFinalDate: pickedDate.toString().substring(0, 10));
        saveDeadline(deadline);
      } else {
        if (pickedDate.isBefore(submissionDeadline.value)) {
          Get.snackbar(
            "Invalid Date",
            "Final deadline cannot be before the submission deadline",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          return;
        }
        finalDeadline.value = pickedDate;
        DeadlineVO? deadline =
            DeadlineVO(secondFinalDate: pickedDate.toString().substring(0, 10));
        saveDeadline(deadline);
      }
    }
  }

  void showCreateUserDialog() {
    FacultyVO? selectedFaculty;
    RoleSection? selectedRole;

    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text("Create User", style: AppTextStyle.h3poppinsBold),
        content: SingleChildScrollView(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: AppTextStyle.h5poppinsRegular,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: AppTextStyle.h5poppinsRegular,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: AppTextStyle.h5poppinsRegular,
                  ),
                ),
                SizedBox(height: 10),

                /// Faculty dropdown
                StatefulBuilder(
                  builder: (context, setState) {
                    return DropdownButtonFormField<FacultyVO>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: "Faculty",
                        labelStyle: AppTextStyle.h5poppinsRegular,
                      ),
                      value: selectedFaculty,
                      items: faculties
                          .map((faculty) => DropdownMenuItem(
                                value: faculty,
                                child: Text(faculty?.name ?? 'Unknown'),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() => selectedFaculty = value);
                      },
                    );
                  },
                ),
                SizedBox(height: 10),

                /// Role dropdown
                StatefulBuilder(
                  builder: (context, setState) {
                    return DropdownButtonFormField<RoleSection>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: "Role",
                        labelStyle: AppTextStyle.h5poppinsRegular,
                      ),
                      value: selectedRole,
                      items: RoleSection.values
                          .map((role) => DropdownMenuItem(
                                value: role,
                                child: Text(role.name),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() => selectedRole = value);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              var user = UserVO(
                name: nameController.text,
                email: emailController.text,
                password: passwordController.text,
                facultyId: selectedFaculty?.id,
                role: selectedRole?.name,
                status: 'active',
                id: DateTime.now().millisecondsSinceEpoch.toString(),
              );

              saveUser(user);
              update;
              _fetchAllUsers();
              nameController.clear();
              emailController.clear();
              passwordController.clear();
              facultyController.clear();
              roleController.clear();
              Get.back();
            },
            child: Text("Create"),
          ),
        ],
      ),
    );
  }

  void showCreateFacultyDialog(FacultyVO? fac) {
    facultynameController.text = fac?.name ?? "";
    descriptionController.text = fac?.description ?? "";
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(fac != null ? "Edit Faculty" : "Create Faculty",
            style: AppTextStyle.h3poppinsBold),
        content: SingleChildScrollView(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                TextField(
                  controller: facultynameController,
                  decoration: InputDecoration(
                      labelText: "Faculty Name",
                      labelStyle: AppTextStyle.h5poppinsRegular),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: "Description",
                      labelStyle: AppTextStyle.h5poppinsRegular),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              var faculty = FacultyVO();
              faculty.name = facultynameController.text;
              faculty.description = descriptionController.text;
              if (fac == null) {
                faculty.id = DateTime.now().microsecondsSinceEpoch.toString();
              } else {
                faculty.id = fac.id;
              }
              saveFaculty(faculty);
              Get.back();
            },
            child: Text(fac != null ? "Edit" : "Create"),
          ),
        ],
      ),
    );
  }

  void logoutDialog({Function? onTapOk, Function? onTapCancel}) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text("Logout", style: AppTextStyle.h3poppinsBold),
        content: Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              if (onTapCancel != null) {
                onTapCancel();
              }
            },
            child: Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              if (onTapOk != null) {
                onTapOk();
              }
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void suspendUserDialog(UserVO? user) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text("Suspend", style: AppTextStyle.h3poppinsBold),
        content: Text("Are you sure you want to suspend this person?"),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              user?.status = "s";
              saveUser(user);
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void deleteUserDialog(String id) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text("Delete User", style: AppTextStyle.h3poppinsBold),
        content: Text("Are you sure you want to delete this user?"),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              deleteUser(id);
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void deleteFacDialog(String id) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text("Delete Faculty", style: AppTextStyle.h3poppinsBold),
        content: Text("Are you sure you want to delete this Faculty?"),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              deleteFaculty(id);
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
