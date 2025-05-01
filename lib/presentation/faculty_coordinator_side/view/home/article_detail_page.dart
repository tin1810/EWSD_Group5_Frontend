import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/app/model/article_vo.dart';
import 'package:university_magazine_project/app/model/comment_vo.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/app/populations/articles.dart';
import 'package:university_magazine_project/hive/dao/article_dao.dart';
import 'package:university_magazine_project/hive/dao/deadline_dao.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/submit/helper/word_file_manager.dart';

class ArticleDetailPage extends StatefulWidget {
  final ArticleVO articleVO;
  final bool isManager;
  const ArticleDetailPage({
    super.key,
    required this.articleVO,
    this.isManager = false,
  });

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage>
    with UserDao, ArticleDao, DeadlineDao {
  UserVO? student;
  @override
  void initState() {
    student =
        getAllUsers()?.firstWhere((e) => e?.id == widget.articleVO.studentId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ArticleBannerWidget(
              title: widget.articleVO.title ?? "No title",
              image: widget.articleVO.imgBytes!,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width / 10),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  NameAndDateWidget(
                    name: student?.name ?? "",
                    date: widget.articleVO.date ?? "",
                  ),
                  const SizedBox(height: 20),
                  Divider(),
                  const SizedBox(height: 20),
                  Text(
                    WordFileManager.extractTextFromDocx(
                        widget.articleVO.wordBytes ?? fakeBytes("yoo")),
                    style: AppTextStyle.h5iterRegular
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 40),
                  Divider(),
                  SizedBox(height: 40),
                  if (widget.isManager == false)
                    CommentBoxWidget(
                      onResubmit: (comment) {
                        if (isAfter14Days(
                            getDeadline()?.secondFinalDate ?? "")) {
                          var user = getAllUsers()
                              ?.firstWhere((e) => e?.isLoggedIn == true);
                          widget.articleVO.comment = CommentVO(
                              comment: comment,
                              coordinatorName: user?.name ?? "");
                          saveArticle(widget.articleVO);
                          Fluttertoast.showToast(msg: "Commented successfully");
                        } else {
                          Fluttertoast.showToast(
                              msg:
                                  "You can't comment after 14 days of final closure date!");
                        }
                      },
                    ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            FooterSection(),
          ],
        ),
      ),
    );
  }

  bool isAfter14Days(String dateString) {
    try {
      final startDate = DateTime.parse(dateString);
      final expiryDate = startDate.add(Duration(days: 14));
      final today = DateTime.now();
      return today.isAfter(expiryDate);
    } catch (e) {
      print("Invalid date format: $e");
      return true;
    }
  }
}

class NameAndDateWidget extends StatelessWidget {
  final String name, date;
  const NameAndDateWidget({
    super.key,
    required this.name,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/commenter.jpg"),
          radius: 14,
        ),
        SizedBox(width: 8),
        Text(
          name,
          style: AppTextStyle.h5iterBold.copyWith(color: Colors.black),
        ),
        const Spacer(),
        Text(
          date,
          style: AppTextStyle.h5iterRegular.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}

class CommentBoxWidget extends StatefulWidget {
  final Function(String) onResubmit;
  const CommentBoxWidget({
    super.key,
    required this.onResubmit,
  });

  @override
  State<CommentBoxWidget> createState() => _CommentBoxWidgetState();
}

class _CommentBoxWidgetState extends State<CommentBoxWidget> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        width: MediaQuery.sizeOf(context).width / 3,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 0),
                blurStyle: BlurStyle.outer,
                blurRadius: 2,
                spreadRadius: 2)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Comment your opinion upon this article to help student.',
                textAlign: TextAlign.center,
                style: AppTextStyle.h5iterBold.copyWith(color: Colors.black)),
            SizedBox(height: 20),
            TextField(
              controller: controller,
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                color: AppColor.blueColor,
                onPressed: () {
                  widget.onResubmit(controller.text);
                },
                child: Text(
                  "Send",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleBannerWidget extends StatelessWidget {
  final Uint8List image;
  final String title;
  const ArticleBannerWidget({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.network(
        //   "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
        //   fit: BoxFit.cover,
        //   width: MediaQuery.sizeOf(context).width,
        //   height: 400,
        // ),
        Image.memory(
          image,
          height: 400,
          width: MediaQuery.sizeOf(context).width,
          errorBuilder: (context, o, e) {
            return Image.asset(
              "assets/images/article_error.jpg",
              height: 400,
              width: MediaQuery.sizeOf(context).width,
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width / 20,
              bottom: MediaQuery.sizeOf(context).width / 20,
              top: 300),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.black.withOpacity(0.4),
            ),
            child: Text(
              title,
              style: AppTextStyle.h2iterRegular.copyWith(color: Colors.white),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                  color: AppColor.blueColor,
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Center(
                child: Text(
                  "Back",
                  style:
                      AppTextStyle.h2iterRegular.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
