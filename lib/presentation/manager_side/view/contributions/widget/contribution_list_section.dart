import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/article_detail_page.dart';
import 'package:university_magazine_project/presentation/manager_side/view/contributions/widget/contribution_item.dart';

class ContributionListSection extends StatelessWidget {
  const ContributionListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      width: double.infinity,
      // decoration: BoxDecoration(
      //   color: AppColor.blueColor.withOpacity(0.2),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Comprehensive Contributions",
            style: AppTextStyle.h1iterBold.copyWith(fontSize: 27),
          ),
          SizedBox(height: 15),
          Text(
            "An overview of all submissions from various faculties.",
            style: AppTextStyle.h4iterRegular,
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return ContributionItem(
                  viewDetail: () {
                    Get.to(() => ArticleDetailPage());
                  },
                  color: AppColor.whiteColor,
                  name: "Total Contributions",
                  date: "10/3/2025",
                  text:
                      "View the total number of contributions submitted across all faculties. This figure reflects the collaborative spirit of our university, showcasing the diverse engagement of our academic departments. Use this data to gauge overall participation and contribution levels.View the total number of contributions submitted across all faculties. This figure reflects the collaborative spirit of our university, showcasing the diverse engagement of our academic departments. Use this data to gauge overall participation and contribution levels.");
            },
          ),
        ],
      ),
    );
  }
}
