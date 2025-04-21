import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/hive/dao/faculty_dao.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';
import 'package:university_magazine_project/presentation/admin/view/widget/faculty_card.dart';

class FacultyPage extends StatelessWidget {
  const FacultyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AdminController adminController = Get.find<AdminController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          AppGraphic.logoImage,
          height: 100,
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
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
                  adminController.showCreateFacultyDialog(null);
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
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Obx(
              () => Wrap(
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                spacing: 20,
                runSpacing: 20,
                children: adminController.faculties.map((e) {
                  return FacultyCard(
                    onTap: () {
                      adminController.showCreateFacultyDialog(e);
                    },
                    onDelete: () {
                      adminController.deleteFacDialog(e?.id ?? "");
                    },
                    name: e?.name ?? "",
                    des: e?.description ?? "",
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
