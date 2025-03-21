import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/faculty_coordinator_homepage.dart';
import 'package:university_magazine_project/presentation/guest_side/controller/home_controller.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/home_page.dart';
import 'package:university_magazine_project/presentation/login/view/login/login_page.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/home/student_home_page.dart';

import '../../../../../app/config/app_textstyle.dart';

class HoverAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController controller = Get.find<HomeController>();
  final String? portal;

  HoverAppBar({super.key, this.portal});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      centerTitle: false,
      title: Obx(
        () => MouseRegion(
          onEnter: (_) => controller.onHover(true),
          onExit: (_) => controller.onHover(false),
          child: MaterialButton(
            minWidth: 100,
            height: 80,
            color: controller.backgroundColor.value,
            onPressed: () {
              if (portal == null || portal == "" || portal == "Portal") {
                Get.to(LoginPage());
              } else {
                Get.to(HomePage());
              }
            },
            child: Text(
              portal ?? "Portal",
              style: AppTextStyle.h5poppinsRegular
                  .copyWith(color: AppColor.whiteColor),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
