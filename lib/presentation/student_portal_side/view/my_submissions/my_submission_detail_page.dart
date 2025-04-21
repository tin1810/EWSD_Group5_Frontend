import 'dart:html';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as rs;
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/app/model/article_vo.dart';
import 'package:university_magazine_project/hive/dao/article_dao.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/article_detail_page.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/my_submissions/my_submissions_page.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/submit/helper/word_file_manager.dart';

class MySubmissionDetailPage extends StatefulWidget {
  final ArticleVO articleVO;
  const MySubmissionDetailPage({
    super.key,
    required this.articleVO,
  });

  @override
  State<MySubmissionDetailPage> createState() => _MySubmissionDetailPageState();
}

class _MySubmissionDetailPageState extends State<MySubmissionDetailPage>
    with UserDao, ArticleDao {
  File? wordFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ArticleBannerWidget(
              title: widget.articleVO.title??"",
              image: widget.articleVO.imgBytes!,
            ),
            SizedBox(height: 20),
            Text(
              widget.articleVO.date ?? "",
              style: AppTextStyle.h5iterRegular.copyWith(color: Colors.grey),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/commenter.jpg"),
                  radius: 14,
                ),
                SizedBox(width: 8),
                Text(
                  widget.articleVO.comment?.coordinatorName ?? "",
                  style: AppTextStyle.h5iterBold.copyWith(color: Colors.black),
                ),
                SizedBox(width: 40),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2,
                  child: Text(
                    widget.articleVO.comment?.comment ?? "",
                    style: AppTextStyle.h5iterRegular
                        .copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 40),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                width: (rs.Device.screenType == rs.ScreenType.desktop ||
                        rs.Device.screenType == rs.ScreenType.tablet)
                    ? 400
                    : 250,
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
                  children: [
                    Text('Resubmit Your Article',
                        style: AppTextStyle.h1iterBold
                            .copyWith(color: Colors.black)),
                    SizedBox(height: 20),
                    Text(
                        'We look forward to reviewing your work until final closure date!',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.h5iterBold
                            .copyWith(color: Colors.black)),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(8),
                      key: Key("3"),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              (wordFile != null)
                                  ? (wordFile!.name.split("/")).last
                                  : "Add Article File(WORD)",
                              style: TextStyle(color: Colors.black),
                            ),
                            InkWell(
                              onTap: () async {
                                wordFile = await WordFileManager
                                    .pickWordFileFromDevice();
                                setState(() {});
                              },
                              child: Icon(
                                Icons.article_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      color: AppColor.blueColor,
                      onPressed: () async {
                        if (wordFile != null) {
                          widget.articleVO.wordBytes =
                              await WordFileManager.convertFileToUnit8List(
                                  wordFile!);
                          saveArticle(widget.articleVO);
                          Fluttertoast.showToast(
                              msg: "Article Submitted Successfully");
                          Get.to(()=>MySubmissionsPage());
                        } else {
                          Fluttertoast.showToast(msg: "Fields Required!");
                        }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
