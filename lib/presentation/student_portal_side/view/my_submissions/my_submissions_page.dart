import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/submit/widgets/contribute_title_widget.dart';

class MySubmissionsPage extends StatelessWidget {
  const MySubmissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HoverAppBar(
        portal: "Student",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadBannerSection(portal: "Student"),
            ContributeTitleWidget(
              title: "Track Your Contribution Status",
              des: "A showcase of the diverse articles you submitted",
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
