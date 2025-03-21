import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';

class FacultyPage extends StatelessWidget {
  const FacultyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HoverAppBar(
        portal: "Portal",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadBannerSection(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Text(
                'Faculty',
                style: AppTextStyle.h1poppinsBold.copyWith(
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                  "Learn more about the courses we offer, and find out how to make an application to join us.",
                  style: AppTextStyle.h3poppinsRegular),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 500,
              width: double.infinity,
              // margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1506377872008-6645d9d29ef7?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
