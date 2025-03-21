import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/banner_imagewith_text.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/submission_list_widget.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';

class FacultyCoordinatorHomepage extends StatelessWidget {
  const FacultyCoordinatorHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: HoverAppBar(portal: "Computer Science Faculty"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeadBannerSection(
                portal: "CS",
              ),
              BannerImageWithTextWidget(
                imagePath: AppGraphic.csFaculty,
                title: "Welcome to Computer Science Faculty",
              ),
              SubmissionListWidget(),
              FooterSection(),
            ],
          ),
        ));
  }
}
