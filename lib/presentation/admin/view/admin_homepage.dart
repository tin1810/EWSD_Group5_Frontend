import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';

class AdminHomePage extends StatelessWidget {
  final AdminController controller = Get.find<AdminController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),
      body: Column(
        children: [
          // SystemSettings(),
          // UserManagement(),
        ],
      ),
    );
  }
}
