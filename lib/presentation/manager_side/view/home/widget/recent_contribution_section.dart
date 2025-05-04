import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/app/model/article_vo.dart';
import 'package:university_magazine_project/app/populations/articles.dart';
import 'package:university_magazine_project/hive/dao/article_dao.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/article_detail_page.dart';

class RecentContributionSection extends StatefulWidget {
  const RecentContributionSection({super.key});

  @override
  _RecentContributionSectionState createState() =>
      _RecentContributionSectionState();
}

class _RecentContributionSectionState extends State<RecentContributionSection>
    with ArticleDao {
  late List<bool> _isHovered;
  List<ArticleVO?>? publishedList;

  @override
  void initState() {
    super.initState();
    publishedList =
        getAllArticles()?.where((e) => e?.isPublished == true).toList();
    _isHovered = List.filled(publishedList?.length ?? 0, false);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 20,
      ),
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Recent Contributions from Our Faculties",
            style: AppTextStyle.h1iterRegular
                .copyWith(color: AppColor.blackColor, fontSize: 30),
          ),
          const SizedBox(height: 8),
          Text(
            "Stay updated with the latest articles and contributions made by students and faculty members across the university.",
            style:
                AppTextStyle.h5iterRegular.copyWith(color: AppColor.blackColor),
          ),
          const SizedBox(height: 50),
          if(publishedList?.length == 0)
            Text(
              "There is no published articles. Once a coordinator has published one, you'll see in here!",
              style: AppTextStyle.h4iterRegular
                  .copyWith(color: AppColor.blackColor, fontSize: 30),
            ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: publishedList?.length ?? 0,
              itemBuilder: (context, index) {
                return MouseRegion(
                  onEnter: (_) => setState(() => _isHovered[index] = true),
                  onExit: (_) => setState(() => _isHovered[index] = false),
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ArticleDetailPage(
                            articleVO: publishedList![index]!,
                            isManager: true,
                          ));
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: _isHovered[index]
                          ? (Matrix4.identity()..scale(1.05))
                          : Matrix4.identity(),
                      width: MediaQuery.sizeOf(context).width / 4,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        boxShadow: _isHovered[index]
                            ? [
                                BoxShadow(
                                  color: AppColor.greyLightColor,
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                )
                              ]
                            : [],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.memory(
                              publishedList?[index]?.imgBytes ??
                                  fakeBytes("hello world"),
                              height: 170,
                              errorBuilder: (context, o, e) {
                                return Image.asset(
                                  "assets/images/article_error.jpg",
                                  height: 170,
                                  width: 170,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            publishedList?[index]?.title ?? "",
                            style: AppTextStyle.h2iterBold
                                .copyWith(color: AppColor.blackColor),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            publishedList?[index]?.date ?? "",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.h3iterRegular
                                .copyWith(color: AppColor.blackColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
