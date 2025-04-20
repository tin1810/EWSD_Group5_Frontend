import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/my_submissions/my_submission_detail_page.dart';

class SubmittedArticle extends StatelessWidget {
  final String image, title, date, comments;
  const SubmittedArticle({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MySubmissionDetailPage();
        }));
      },
      child: SizedBox(
        width: (MediaQuery.sizeOf(context).width / 4),
        child: Column(
          children: [
            Image.network(
              image,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: AppTextStyle.h2iterBold.copyWith(color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              date,
              textAlign: TextAlign.center,
              style: AppTextStyle.h4iterBold.copyWith(color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              '$comments comments',
              textAlign: TextAlign.center,
              style: AppTextStyle.h5iterBold.copyWith(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
