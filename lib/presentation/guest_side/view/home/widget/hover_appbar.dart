import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';
import 'package:university_magazine_project/presentation/admin/view/admin_homepage.dart';
import 'package:university_magazine_project/presentation/guest_side/controller/home_controller.dart';
import 'package:university_magazine_project/presentation/guest_side/view/faulty/faulty_page.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/home_page.dart';
import 'package:university_magazine_project/presentation/manager_side/view/home/manager_homepage.dart';
import 'package:university_magazine_project/presentation/portal/view/login/login_page.dart';

import '../../../../../app/config/app_textstyle.dart';

class HoverAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? portal;

  const HoverAppBar({super.key, this.portal});

  @override
  State<HoverAppBar> createState() => _HoverAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HoverAppBarState extends State<HoverAppBar> with UserDao {
  final HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.primaryColor,
          centerTitle: false,
          title: MouseRegion(
            onEnter: (_) => controller.onHover(true),
            onExit: (_) => controller.onHover(false),
            child: MaterialButton(
              minWidth: 100,
              height: 80,
              color: controller.backgroundColor.value,
              child: Text(
                (widget.portal == null ||
                        widget.portal == "" ||
                        widget.portal == "Portal")
                    ? "Portal"
                    : "Back To Main",
                style: AppTextStyle.h5poppinsRegular
                    .copyWith(color: AppColor.whiteColor),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
                // if (widget.portal == null ||
                //     widget.portal == "" ||
                //     widget.portal == "Portal") {
                //   Get.to(() => LoginPage());
                // } else {
                //   var user = controller.user.value;
                //   if (user.role == "Student") {
                //     Get.offAll(() => HomePage());
                //   } else if (user.role == "Coordinator") {
                //     Get.offAll(() => FacultyPage());
                //   } else if (user.role == "Manager") {
                //     Get.offAll(() => ManagerHomepage());
                //   } else if (user.role == "Admin") {
                //     Get.offAll(() => AdminHomePage());
                //   }
                // }
              },
            ),
          ),
          actions: (controller.user.value.name == null)
              ? null
              : [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/commenter.jpg"),
                    radius: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    controller.user.value.name ?? "",
                    style: AppTextStyle.h5poppinsRegular
                        .copyWith(color: AppColor.whiteColor),
                  ),
                  const SizedBox(width: 4),
                ],
        ));
  }
}
