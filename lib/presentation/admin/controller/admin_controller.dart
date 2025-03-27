import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

enum AdminSection { system, users, logout }

class AdminController extends GetxController {
  var submissionDeadline = DateTime(2025, 6, 12).obs;
  var finalDeadline = DateTime(2025, 9, 12).obs;
  var selectedSection = AdminSection.system.obs;

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
}
