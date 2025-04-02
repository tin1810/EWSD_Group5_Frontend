import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';
import 'package:university_magazine_project/presentation/admin/view/faculty_page.dart';
import 'package:university_magazine_project/presentation/admin/view/system_settings.dart';
import 'package:university_magazine_project/presentation/admin/view/user_management.dart';
import 'package:university_magazine_project/presentation/admin/view/widget/side_appbar.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminController adminController = Get.find<AdminController>();
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Row(
          children: [
            SideAppBar(
              onClicked: (AdminSection section) {
                adminController.changeSection(section);

                if (section == AdminSection.logout) {
                  adminController.logoutDialog();
                }
              },
            ),
            Expanded(
              child: Obx(() {
                switch (adminController.selectedSection.value) {
                  case AdminSection.system:
                    return SystemSetting();
                  case AdminSection.users:
                    return UserManagement();
                  case AdminSection.faculty:
                    return FacultyPage();
                  default:
                    return Container();
                }
              }),
            ),
          ],
        ));
  }
}
