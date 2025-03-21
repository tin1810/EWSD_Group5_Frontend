import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';

class SubmissionListWidget extends StatelessWidget {
  const SubmissionListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.greyBGColor,
      ),
      child: Column(
        children: [
          Text("Student Submissions Overview"),
          // Add your code here
        ],
      ),
    );
  }
}
