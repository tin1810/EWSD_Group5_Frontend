import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';

class SystemSettings extends StatelessWidget {
  const SystemSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminController controller = Get.find<AdminController>();
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("Submission Deadline: "),
            subtitle: Obx(() => Text(controller.submissionDeadline.value)),
            trailing: ElevatedButton(
              onPressed: () => controller.setSubmissionDeadline("2025-04-15"),
              child: Text("Set"),
            ),
          ),
          ListTile(
            title: Text("Final Deadline: "),
            subtitle: Obx(() => Text(controller.finalDeadline.value)),
            trailing: ElevatedButton(
              onPressed: () => controller.setFinalDeadline("2025-04-30"),
              child: Text("Set"),
            ),
          ),
        ],
      ),
    );
  }
}
