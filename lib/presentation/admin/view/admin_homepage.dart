import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as rs;
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_constants.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';
import 'package:university_magazine_project/presentation/admin/view/faculty_page.dart';
import 'package:university_magazine_project/presentation/admin/view/system_settings.dart';
import 'package:university_magazine_project/presentation/admin/view/user_management.dart';
import 'package:university_magazine_project/presentation/admin/view/widget/side_appbar.dart';
import 'package:university_magazine_project/presentation/guest_side/controller/home_controller.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/home_page.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> with UserDao {
  UserVO? loggedInUser;

  @override
  void initState() {
    try {
      loggedInUser = getAllUsers()?.firstWhere((e) => e?.isLoggedIn ?? false);
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
    super.initState();
  }

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
                adminController.logoutDialog(
                  onTapOk: () {
                    loggedInUser?.isLoggedIn = false;
                    saveUser(loggedInUser);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  onTapCancel: () {
                    adminController.changeSection(oldSec);
                  },
                );
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
                        adminController.logoutDialog(
                          onTapOk: () {
                            loggedInUser?.isLoggedIn = false;
                            saveUser(loggedInUser);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          },
                          onTapCancel: () {
                            adminController.changeSection(oldSec);
                          },
                        );
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
