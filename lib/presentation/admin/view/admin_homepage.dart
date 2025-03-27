import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';
import 'package:university_magazine_project/presentation/admin/view/system_settings.dart';
import 'package:university_magazine_project/presentation/admin/view/user_management.dart';
import 'package:university_magazine_project/presentation/admin/view/widget/side_appbar.dart';
import 'package:university_magazine_project/presentation/admin/view/widget/systemcard.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/banner_imagewith_text.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';

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
                  default:
                    return Container();
                }
              }),
            ),
          ],
        ));
  }
}
