import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class BannerImageWithTextWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool isManager;
  const BannerImageWithTextWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.isManager,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: 500,
      // margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: isManager
          ? Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColor.blackColor.withOpacity(0.6),
              ),
              child: Text(
                title,
                style: AppTextStyle.h1iterBold
                    .copyWith(color: AppColor.whiteColor, fontSize: 30),
              ),
            )
          : Text(
              title,
              style: AppTextStyle.h1iterBold
                  .copyWith(color: AppColor.whiteColor, fontSize: 30),
            ),
    );
  }
}
