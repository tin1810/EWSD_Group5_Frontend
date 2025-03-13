import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/banner_image_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/firstrow_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HoverAppBar(portal: "Student",),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeadBannerSection(portal: "Student"),
            BannerImageSection(),
            SizedBox(
              height: 150,
            ),
            FirstRowSection(),
          ],
        ),
      ),
    );
  }
}
