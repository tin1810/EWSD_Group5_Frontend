import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as rs;
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
    GlobalKey key = GlobalKey(debugLabel: "d");
    return Scaffold(
        key: key,
        backgroundColor: AppColor.whiteColor,
        drawer: Drawer(
          child: SideAppBar(
            width: 140,
            onClicked: (AdminSection section) {
              var oldSec = adminController.selectedSection.value;
              adminController.changeSection(section);

              if (section == AdminSection.logout) {
                adminController.logoutDialog(onTapOk: () {
                  adminController.changeSection(oldSec);
                });
              }
            },
          ),
        ),
        body: Stack(
          children: [
            Row(
              children: [
                if (rs.Device.screenType == rs.ScreenType.desktop ||
                    rs.Device.screenType == rs.ScreenType.tablet)
                  SideAppBar(
                    onClicked: (AdminSection section) {
                      var oldSec = adminController.selectedSection.value;
                      adminController.changeSection(section);

                      if (section == AdminSection.logout) {
                        adminController.logoutDialog(onTapOk: () {
                          adminController.changeSection(oldSec);
                        });
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
            ),
            if (rs.Device.screenType == rs.ScreenType.mobile)
              Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
              ),
          ],
        ));
  }
}
