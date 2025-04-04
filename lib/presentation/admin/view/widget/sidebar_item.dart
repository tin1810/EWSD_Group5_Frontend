import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';

class SideBarItem extends StatelessWidget {
  final String title;
  final AdminSection section;
  final IconData icon;
  final Function onTap;
  const SideBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    final AdminController adminController = Get.find<AdminController>();
    return Obx(
      () => MaterialButton(
          minWidth: double.infinity,
          hoverColor: AppColor.blueColor,
          color: adminController.selectedSection.value.toString() ==
                  section.toString()
              ? AppColor.blueColor
              : AppColor.greyLightColor.withOpacity(0.3),
          height: 70,
          onPressed: () {
            onTap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: AppColor.whiteColor,
              ),
              SizedBox(
                width: 20,
              ),
              Text(title,
                  style: AppTextStyle.h4iterRegular
                      .copyWith(color: AppColor.whiteColor)),
            ],
          )),
    );
  }
}
