import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/hive/dao/article_dao.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_zoom_image.dart';

class ThirdRowSection extends StatelessWidget with ArticleDao {
  const ThirdRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      decoration: BoxDecoration(color: AppColor.greyBGColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Articles",
                  style: AppTextStyle.h1poppinsBold
                      .copyWith(fontSize: 30, color: AppColor.blackColor),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 100,
                  height: 3,
                  color: AppColor.hoverAppBarColor,
                ),
                const SizedBox(height: 12),
                Text(
                  "Stay informed about the latest happenings at UOG. From groundbreaking research discoveries to exciting campus events, we capture it all.",
                  style: AppTextStyle.h4poppinsRegular,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SizedBox(width: 20), // Adds spacing between text and news list
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 500,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Row(
                  children: getAllArticles()
                          ?.where((ei) => ei?.isPublished == true)
                          .toList()
                          .map((e) {
                        var img = e!.imgBytes;
                        return AnnouncementWidget(
                          image: img!,
                          des: e.title ?? "",
                          date: e.date ??
                              DateTime.now().toString().substring(0, 10),
                        );
                      }).toList() ??
                      [],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnnouncementWidget extends StatelessWidget {
  final String date, des;
  final Uint8List image;
  const AnnouncementWidget({
    super.key,
    required this.image,
    this.date = "March 14 2025",
    this.des =
        "UOG Comprehensive Snakebite Program is one of few in the state to offer snakebite care in an outpatient setting",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: 310,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HoverZoomImage(
            imageUrl: image,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                maxRadius: 2,
                backgroundColor: AppColor.blackColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(date,
                  style: AppTextStyle.h5poppinsRegular
                      .copyWith(color: AppColor.blackColor.withOpacity(0.7))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(des,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.h2poppinsRegular
                  .copyWith(color: AppColor.blackColor)),
        ],
      ),
    );
  }
}
