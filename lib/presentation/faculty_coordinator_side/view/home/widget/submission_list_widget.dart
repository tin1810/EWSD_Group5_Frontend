import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/article_detail_page.dart';
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
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Filter",
                  style: AppTextStyle.h4poppinsBold,
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ContributionFilterDialog();
                        });
                  },
                  icon: Icon(
                    Icons.filter_alt_outlined,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return SubmissionItemWidget(
                  viewDetail: () {
                    Get.to(() => ArticleDetailPage());
                  },
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

class ContributionFilterDialog extends StatelessWidget {
  const ContributionFilterDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width / 2,
          height: 140,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: 1,
                      onChanged: (nv) {
                        Get.back();
                      },
                    ),
                    Text(
                      "All",
                      style: AppTextStyle.h4iterRegular,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: 1,
                      onChanged: (nv) {
                        Get.back();
                      },
                    ),
                    Text(
                      "Contributions With Comment",
                      maxLines: 2,
                      style: AppTextStyle.h6iterRegular,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 3,
                      groupValue: 1,
                      onChanged: (nv) {
                        Get.back();
                      },
                    ),
                    Text(
                      "Contributions Without Comment",
                      maxLines: 2,
                      style: AppTextStyle.h6iterRegular,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
