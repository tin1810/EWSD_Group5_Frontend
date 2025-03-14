import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class ThirdRowSection extends StatelessWidget {
  const ThirdRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      decoration: BoxDecoration(color: AppColor.greyBGColor),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Latest News",
                style: AppTextStyle.h1poppinsBold
                    .copyWith(fontSize: 30, color: AppColor.blackColor),
              ),
              Container(
                width: 100,
                height: 3,
                color: AppColor.hoverAppBarColor,
              ),
              Text(
                  "Stay informed about the latest happenings at UAB. From groundbreaking research discoveries to exciting campus events, we capture it all.",
                  style: AppTextStyle.h4poppinsRegular),
              MaterialButton(
                minWidth: 100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hoverColor: AppColor.hoverAppBarColor,
                padding: EdgeInsets.all(18),
                color: AppColor.blueColor,
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "More News",
                      style: AppTextStyle.h5poppinsRegular
                          .copyWith(color: AppColor.whiteColor),
                    ),
                    Icon(Icons.arrow_forward_outlined,
                        color: AppColor.whiteColor)
                  ],
                ),
              ),
            ],
          ),
          ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                );
              }),
        ],
      ),
    );
  }
}
