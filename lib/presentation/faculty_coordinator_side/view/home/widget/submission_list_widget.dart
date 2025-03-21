import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/submission_item_widget.dart';

class SubmissionListWidget extends StatelessWidget {
  const SubmissionListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 70),
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.blueColor.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Student Submissions Overview",
            style: AppTextStyle.h1iterBold.copyWith(fontSize: 26),
          ),
          SizedBox(height: 10),
          Text(
            "Explore the innovative ideas and research contributions from our Computer Science students.",
            style: AppTextStyle.h4iterRegular,
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return SubmissionItemWidget(
                  color: AppColor.whiteColor,
                  name: "Rose",
                  date: "12/12/2021",
                  text:
                      "Access a comprehensive list of all contributions submitted by students within the Computer Science Faculty. This feature allows faculty members to review the work and insights of students, ensuring that all contributions are acknowledged and assessed appropriately.");
            },
          ),
        ],
      ),
    );
  }
}
