import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/app/model/article_vo.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/article_dao.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/article_detail_page.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/submission_item_widget.dart';

class SubmissionListWidget extends StatefulWidget {
  const SubmissionListWidget({
    super.key,
  });

  @override
  State<SubmissionListWidget> createState() => _SubmissionListWidgetState();
}

class _SubmissionListWidgetState extends State<SubmissionListWidget>
    with UserDao, ArticleDao {
  UserVO? loggedInUser;
  List<ArticleVO?>? articleList;

  @override
  void initState() {
    try {
      loggedInUser = getAllUsers()?.firstWhere((e) => e?.isLoggedIn ?? false);
      articleList = getAllArticles()
          ?.where((e) => e?.facultyId == loggedInUser?.facultyId)
          .toList();
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
    super.initState();
  }

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
          // Align(
          //   alignment: Alignment.topRight,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Text(
          //         "Filter",
          //         style: AppTextStyle.h4poppinsBold,
          //       ),
          //       IconButton(
          //         onPressed: () {
          //           showDialog(
          //               context: context,
          //               builder: (context) {
          //                 return ContributionFilterDialog();
          //               });
          //         },
          //         icon: Icon(
          //           Icons.filter_alt_outlined,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: articleList?.length ?? 0,
            itemBuilder: (context, index) {
              var sid = articleList?[index]?.studentId ?? "";
              var student = getAllUsers()?.firstWhere((e) => e?.id == sid);
              return SubmissionItemWidget(
                viewDetail: () {
                  Get.to(() => ArticleDetailPage(
                        articleVO: articleList?[index] ?? ArticleVO(),
                      ));
                },
                color: AppColor.whiteColor,
                name: student?.name ?? "",
                date: articleList?[index]?.date ?? "",
                text: articleList?[index]?.title ?? "",
                isCommented: articleList?[index]?.comment != null,
                imageUrl: articleList![index]!.imgBytes!,
              );
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
