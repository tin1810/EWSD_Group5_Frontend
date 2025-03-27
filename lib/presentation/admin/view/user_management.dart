import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';
import 'package:university_magazine_project/presentation/admin/view/widget/systemcard.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AdminController adminController = Get.find<AdminController>();
    return Column(
      children: [
        Image.asset(AppGraphic.logoImage, height: 100),
        SizedBox(
          height: 40,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Text("User Management",
                style: AppTextStyle.h1iterBold
                    .copyWith(color: AppColor.primaryColor)),
          ),
        ),
        Row(
          children: [
            Obx(
              () => Systemcard(
                title: adminController
                    .formatDate(adminController.submissionDeadline.value),
                value: 'Submission Deadline',
                icon: FontAwesomeIcons.calendar,
                color: AppColor.hoverAppBarColor,
                onClicked: () => adminController.selectDate(true),
              ),
            ),
            Obx(() => Systemcard(
                  title: adminController
                      .formatDate(adminController.finalDeadline.value),
                  value: 'Final Deadline',
                  icon: FontAwesomeIcons.calendar,
                  color: Colors.purple,
                  onClicked: () => adminController.selectDate(false),
                )),
          ],
        ),
      ],
    );
  }
}
