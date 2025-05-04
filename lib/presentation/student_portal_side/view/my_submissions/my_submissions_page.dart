import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/article_dao.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/my_submissions/my_submission_detail_page.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/my_submissions/widgets/submitted_article.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/submit/widgets/contribute_title_widget.dart';

class MySubmissionsPage extends StatefulWidget {
  const MySubmissionsPage({super.key});

  @override
  State<MySubmissionsPage> createState() => _MySubmissionsPageState();
}

class _MySubmissionsPageState extends State<MySubmissionsPage>
    with ArticleDao, UserDao {
  UserVO? loggedInUser;
  @override
  void initState() {
    try {
      loggedInUser = getAllUsers()?.firstWhere((e) => e?.isLoggedIn ?? false);
    } catch (e) {
      print(e.toString());
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HoverAppBar(
        portal: "Student",
        userVO: loggedInUser,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeadBannerSection(portal: "Student"),
            ContributeTitleWidget(
              title: "Track Your Submission",
              des:
                  "Stay informed about the status of your article submissions with our easy-to-use tracking tool.",
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("UPLOADED ARTICLES",
                    style:
                        AppTextStyle.h1iterBold.copyWith(color: Colors.black)),
              ),
            ),
            SizedBox(height: 40),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: getAllArticles()?.where((e)=> e?.studentId == loggedInUser?.id).map((e) {
                    var img = e!.imgBytes;
                    return SubmittedArticle(
                      imgBytes: img!,
                      title: e.title ?? "",
                      date: e.studentId ?? "",
                      comments: e.comment != null ? "1" : "0",
                      onTap: () {
                        Get.to(() => MySubmissionDetailPage(articleVO: e));
                      },
                    );
                  }).toList() ??
                  [],
            ),
            SizedBox(height: 20),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
