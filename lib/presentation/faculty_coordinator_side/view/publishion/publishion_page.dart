import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/app/model/article_vo.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/article_dao.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/article_detail_page.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/banner_imagewith_text.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/submission_item_widget.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';

class PublishionPage extends StatefulWidget {
  const PublishionPage({super.key});

  @override
  _PublishionPageState createState() => _PublishionPageState();
}

class _PublishionPageState extends State<PublishionPage>
    with UserDao, ArticleDao {
  UserVO? loggedInUser;
  List<ArticleVO?>? articleList;

  @override
  void initState() {
    try {
      loggedInUser = getAllUsers()?.firstWhere((e) => e?.isLoggedIn ?? false);
      var facID = loggedInUser?.facultyId;
      articleList =
          getAllArticles()?.where((e) => e?.facultyId == facID).toList();
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HoverAppBar(portal: "Coordinator"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeadBannerSection(
              portal: "Coordinator",
            ),
            BannerImageWithTextWidget(
              imagePath: AppGraphic.csFaculty,
              title: "Publish Student Submissions",
              isManager: false,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              width: double.infinity,
              decoration: BoxDecoration(
                  // color: AppColor.blueColor.withOpacity(0.2),
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Faculty Students' Submissions",
                    style: AppTextStyle.h1iterBold.copyWith(fontSize: 26),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Select Your Favourite Article to Publish",
                    style: AppTextStyle.h4iterRegular,
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: articleList?.length ?? 0,
                    itemBuilder: (context, index) {
                      var sid = articleList?[index]?.studentId ?? "";
                      var student =
                          getAllUsers()?.firstWhere((e) => e?.id == sid);
                      return GestureDetector(
                        onTap: () {
                          var isSelected =
                              articleList?[index]?.isSelected ?? false;
                          articleList?[index]?.isSelected = !isSelected;
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Row(
                            children: [
                              Checkbox(
                                checkColor: AppColor.whiteColor,
                                activeColor: AppColor.blueColor,
                                value: articleList?[index]?.isSelected ?? false,
                                onChanged: (bool? value) {
                                  var isSelected =
                                      articleList?[index]?.isSelected ?? false;
                                  articleList?[index]?.isSelected = !isSelected;
                                  setState(() {});
                                },
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: SubmissionItemWidget(
                                  viewDetail: () {
                                    Get.to(() => ArticleDetailPage(
                                          articleVO: articleList?[index] ??
                                              ArticleVO(),
                                        ));
                                  },
                                  color: AppColor.whiteColor,
                                  name: student?.name ?? "",
                                  date: articleList?[index]?.date ?? "",
                                  text: articleList?[index]?.title ?? "",
                                  isCommented:
                                      articleList?[index]?.comment != null,
                                  imageUrl: articleList![index]!.imgBytes!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      onPressed: () {
                        var list = articleList
                                ?.where((e) => e?.isSelected ?? false)
                                .toList() ??
                            [];
                        if (list.isNotEmpty) {
                          for (ArticleVO? article in list) {
                            article?.isSelected = true;
                            article?.isPublished = true;
                            saveArticle(article);
                          }
                          Fluttertoast.showToast(
                              msg:
                                  "Selected Articles are successfully published");
                        }
                      },
                      color: AppColor.blueColor,
                      disabledColor: Colors.grey,
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Publish",
                        style: AppTextStyle.h4iterBold
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
