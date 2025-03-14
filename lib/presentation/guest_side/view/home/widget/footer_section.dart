import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/guest_side/controller/home_controller.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_icon.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      decoration: BoxDecoration(color: AppColor.primaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "University of Greenwich",
            style: AppTextStyle.h1poppinsRegular
                .copyWith(color: AppColor.whiteColor, fontSize: 30),
          ),
          Text(
            "Old Royal Naval College, Park Row,\nLondon SE10 9LS, United Kingdom",
            style: AppTextStyle.h5poppinsRegular
                .copyWith(color: AppColor.whiteColor),
          ),
          SizedBox(
            height: 35,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            hoverColor: AppColor.blueColor.withOpacity(0.3),
            padding: EdgeInsets.all(18),
            color: AppColor.blueColor.withOpacity(0.6),
            onPressed: () {},
            child: Text(
              "Contact Us",
              style: AppTextStyle.h5poppinsRegular
                  .copyWith(color: AppColor.whiteColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: homeController.socialIcons
                .map(
                  (item) => HoverButton(
                    icon: item['icon'],
                    url: item['url'],
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            color: AppColor.greyLightColor.withOpacity(0.3),
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "The University of Greenwich is a charity and company limited by guarantee, registered in England.",
              style: AppTextStyle.h3poppinsRegular.copyWith(
                color: AppColor.whiteColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
