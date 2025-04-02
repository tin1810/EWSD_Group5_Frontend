import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';
import 'package:university_magazine_project/presentation/admin/view/widget/faculty_card.dart';

class FacultyPage extends StatelessWidget {
  const FacultyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AdminController adminController = Get.find<AdminController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(AppGraphic.logoImage, height: 100),
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Faculty Dashboard",
                      style: AppTextStyle.h1iterBold
                          .copyWith(color: AppColor.primaryColor)),
                  MaterialButton(
                    padding: EdgeInsets.all(18),
                    color: Colors.cyan.shade200,
                    elevation: 0.6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      adminController.showCreateFacultyDialog(context);
                    },
                    child: Row(
                      children: [
                        Text(
                          'Create Faculty',
                          style: AppTextStyle.h5iterRegular,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          FontAwesomeIcons.add,
                          size: 15,
                          color: AppColor.blackColor.withOpacity(0.8),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: List.generate(15, (index) {
                return FacultyCard(
                  name: "Computer Science Faculty",
                  lesson: "${index + 1} lessons",
                );
              }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
