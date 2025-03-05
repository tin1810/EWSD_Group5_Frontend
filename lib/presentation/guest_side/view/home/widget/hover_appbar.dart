import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/presentation/guest_side/controller/home_controller.dart';

import '../../../../../app/config/app_textstyle.dart';

class HoverAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController controller = Get.find<HomeController>();

  HoverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => MouseRegion(
          onEnter: (_) => controller.onHover(true),
          onExit: (_) => controller.onHover(false),
          child: AppBar(
            backgroundColor: AppColor.primaryColor,
            title: MaterialButton(
              color: controller.backgroundColor.value,
              onPressed: () {
                // controller.onHover(false);
              },
              child: Text(
                'Portal',
                style: AppTextStyle.appBarText
                    .copyWith(color: AppColor.whiteColor),
              ),
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
