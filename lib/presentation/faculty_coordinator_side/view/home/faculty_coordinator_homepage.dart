import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/banner_imagewith_text.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/submission_list_widget.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';

class FacultyCoordinatorHomepage extends StatelessWidget {
  const FacultyCoordinatorHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    var commentPercent = 80;
    var missPercent = 100 - commentPercent;
    var progressPercent = missPercent / 100;
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: HoverAppBar(portal: "Coordinator"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeadBannerSection(
                portal: "Coordinator",
              ),
              BannerImageWithTextWidget(
                imagePath: AppGraphic.csFaculty,
                title: "Welcome to Computer Science Faculty",
                isManager: false,
              ),
              SubmissionListWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Faculty Report",
                    style: AppTextStyle.h2poppinsBold
                        .copyWith(fontSize: 18,color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CoordinatorReport(progressPercent: progressPercent, commentPercent: commentPercent),
              SizedBox(height: 20),
              FooterSection(),
            ],
          ),
        ));
  }
}

class CoordinatorReport extends StatelessWidget {
  const CoordinatorReport({
    super.key,
    required this.progressPercent,
    required this.commentPercent,
  });

  final double progressPercent;
  final int commentPercent;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      runSpacing: 20,
      spacing: 30,
      children: [
        CircularPercentIndicator(
          radius: 100,
          lineWidth: 30,
          percent: progressPercent,
          progressColor: Colors.redAccent,
          backgroundColor: Colors.greenAccent,
          circularStrokeCap: CircularStrokeCap.butt,
          center: Text(
            "$commentPercent%",
          ),
        ),
        SizedBox(
          width: 340,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 8,
                    color: Colors.green,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Commented (within 14 days)",
                    style: AppTextStyle.h5poppinsRegular
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 8,
                    color: Colors.red,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Without comments (within 14 days)",
                    style: AppTextStyle.h5poppinsRegular
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
