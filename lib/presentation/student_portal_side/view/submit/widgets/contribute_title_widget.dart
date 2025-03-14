import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class ContributeTitleWidget extends StatelessWidget {
  final String title, des;
  const ContributeTitleWidget({
    super.key,
    this.title = "Contribute Your Expertise",
    this.des = "Share your insights and knowledge with our academic community",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(92, 133, 158, 1),
            Color.fromRGBO(110, 146, 172, 1),
            Color.fromRGBO(137, 173, 200, 1),
            Color.fromRGBO(110, 146, 172, 1),
            Color.fromRGBO(92, 133, 158, 1),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: AppTextStyle.h1iterBold.copyWith(color: Colors.white)),
          SizedBox(height: 20),
          Text(des,
              textAlign: TextAlign.center,
              style: AppTextStyle.h5iterBold.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
