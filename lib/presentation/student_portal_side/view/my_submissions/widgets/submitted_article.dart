import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/my_submissions/my_submission_detail_page.dart';

class SubmittedArticle extends StatelessWidget {
  final Uint8List imgBytes;
  final String title, date, comments;
  final Function onTap;
  const SubmittedArticle({
    super.key,
    required this.imgBytes,
    required this.title,
    required this.date,
    required this.comments,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        width: (MediaQuery.sizeOf(context).width / 4),
        child: Column(
          children: [
            Image.memory(
              imgBytes,
              height: 170,
              errorBuilder: (context, o, e) {
                return Image.asset(
                  "assets/images/article_error.jpg",
                  height: 170,
                  width: 170,
                );
              },
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
