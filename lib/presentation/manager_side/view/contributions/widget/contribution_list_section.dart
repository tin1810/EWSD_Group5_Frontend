import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/app/model/article_vo.dart';
import 'package:university_magazine_project/app/populations/articles.dart';
import 'package:university_magazine_project/hive/dao/article_dao.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/article_detail_page.dart';
import 'package:university_magazine_project/presentation/manager_side/view/contributions/widget/contribution_item.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/submit/helper/word_file_manager.dart';

class ContributionListSection extends StatefulWidget {
  const ContributionListSection({
    super.key,
  });

  @override
  State<ContributionListSection> createState() =>
      _ContributionListSectionState();
}

class _ContributionListSectionState extends State<ContributionListSection>
    with ArticleDao, UserDao {
  List<ArticleVO?>? publishedList;
  @override
  void initState() {
    publishedList =
        getAllArticles()?.where((e) => e?.isPublished == true).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      width: double.infinity,
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
            itemCount: publishedList?.length ?? 0,
            itemBuilder: (context, index) {
              var student = getAllUsers()?.firstWhere(
                  (e) => e?.id == publishedList?[index]?.studentId);
              return ContributionItem(
                  onDownload: () async {
                    WordFileManager.downloadAsZip(
                        publishedList?[index]?.wordBytes ?? fakeBytes("fake"));
                  },
                  color: AppColor.whiteColor,
                  name: publishedList?[index]?.title,
                  date: publishedList?[index]?.date,
                  imageUrl: publishedList?[index]?.imgBytes,
                  text: "Written By ${student?.name ?? "Anonymous"}");
            },
          ),
        ],
      ),
    );
  }
}
