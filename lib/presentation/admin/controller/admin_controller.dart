import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/app/model/user_model.dart';

enum AdminSection { system, users, faculty, logout }

class AdminController extends GetxController {
  var submissionDeadline = DateTime(2025, 6, 12).obs;
  var finalDeadline = DateTime(2025, 9, 12).obs;
  var selectedSection = AdminSection.system.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController facultyController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController lessonController = TextEditingController();
  final TextEditingController facultynameController = TextEditingController();

  final Rx<Uint8List?> profileImage = Rx<Uint8List?>(null);
  void changeSection(AdminSection section) {
    selectedSection.value = section;
  }

  final users = [
    User(
        name: 'John Doe',
        role: 'Student',
        status: 'Active',
        email: 'john@gmail.com',
        faculty: "Computer Science"),
    User(
        name: 'Jane Smith',
        role: 'Coordinator',
        status: 'Active',
        email: 'jane@gmail.com',
        faculty: "Computer Science"),
    User(
        name: 'Alice Johnson',
        role: 'Stident',
        status: 'Active',
        email: 'alice@gmail.com',
        faculty: "Law"),
    User(
        name: 'Bob Brown',
        role: 'Marketing Manager',
        status: 'Active',
        email: 'bob@gmail.com',
        faculty: 'Medicine'),
    User(
        name: 'Charlie Davis',
        role: 'Coordinator',
        status: 'Active',
        email: 'davis@gmail.com',
        faculty: 'Law'),
  ];
  String formatDate(DateTime date) {
    return DateFormat('dd MMMM yyyy').format(date);
  }

  Future<void> pickProfileImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true, // Get the image as bytes
    );

    if (result != null && result.files.isNotEmpty) {
      profileImage.value = result.files.first.bytes;
    }
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
        // Ensure Submission Deadline is not after Final Deadline
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
      } else {
        // Ensure Final Deadline is not before Submission Deadline
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
      }
    }
  }

  void showCreateUserDialog(BuildContext context) {
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
                GestureDetector(
                  onTap: () {
                    pickProfileImage();
                  },
                  child: Obx(() => CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: profileImage.value != null
                            ? MemoryImage(profileImage.value!)
                            : null,
                        child: profileImage.value == null
                            ? Icon(Icons.camera_alt,
                                color: Colors.white, size: 30)
                            : null,
                      )),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: AppTextStyle.h5poppinsRegular),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: AppTextStyle.h5poppinsRegular),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: facultyController,
                  decoration: InputDecoration(
                      labelText: "Faculty",
                      labelStyle: AppTextStyle.h5poppinsRegular),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: roleController,
                  decoration: InputDecoration(
                      labelText: "Role",
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
              // adminController.addUser(
              //   nameController.text,
              //   emailController.text,
              //   facultyController.text,
              //   roleController.text,
              // );
              Get.back();
            },
            child: Text("Create"),
          ),
        ],
      ),
    );
  }

  void showEditUserDialog(BuildContext context) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text("Edit User", style: AppTextStyle.h3poppinsBold),
        content: SingleChildScrollView(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    pickProfileImage();
                  },
                  child: Obx(() => CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: profileImage.value != null
                            ? MemoryImage(profileImage.value!)
                            : null,
                        child: profileImage.value == null
                            ? Icon(Icons.camera_alt,
                                color: Colors.white, size: 30)
                            : null,
                      )),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: AppTextStyle.h5poppinsRegular),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: AppTextStyle.h5poppinsRegular),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: facultyController,
                  decoration: InputDecoration(
                      labelText: "Faculty",
                      labelStyle: AppTextStyle.h5poppinsRegular),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: roleController,
                  decoration: InputDecoration(
                      labelText: "Role",
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
              // adminController.addUser(
              //   nameController.text,
              //   emailController.text,
              //   facultyController.text,
              //   roleController.text,
              // );
              Get.back();
            },
            child: Text("Edit"),
          ),
        ],
      ),
    );
  }

  void showCreateFacultyDialog(BuildContext context) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text("Create Faculty", style: AppTextStyle.h3poppinsBold),
        content: SingleChildScrollView(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    pickProfileImage();
                  },
                  child: Obx(() => CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: profileImage.value != null
                            ? MemoryImage(profileImage.value!)
                            : null,
                        child: profileImage.value == null
                            ? Icon(Icons.camera_alt,
                                color: Colors.white, size: 30)
                            : null,
                      )),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: facultynameController,
                  decoration: InputDecoration(
                      labelText: "Faculty Name",
                      labelStyle: AppTextStyle.h5poppinsRegular),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: lessonController,
                  decoration: InputDecoration(
                      labelText: "Lessons",
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
              // adminController.addUser(
              //   nameController.text,
              //   emailController.text,
              //   facultyController.text,
              //   roleController.text,
              // );
              Get.back();
            },
            child: Text("Create"),
          ),
        ],
      ),
    );
  }

  void logoutDialog() {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text("Logout", style: AppTextStyle.h3poppinsBold),
        content: Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              // Perform logout logic here
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void deleteUserDialog() {
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
              // Perform logout logic here
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
