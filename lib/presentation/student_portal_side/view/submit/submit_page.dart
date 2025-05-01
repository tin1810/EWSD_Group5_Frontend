import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as rs;
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_constants.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/app/model/article_vo.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/article_dao.dart';
import 'package:university_magazine_project/hive/dao/deadline_dao.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/my_submissions/my_submissions_page.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/submit/helper/word_file_manager.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/submit/widgets/contribute_title_widget.dart';
import 'dart:html';
import 'package:http/http.dart' as http;

class SubmitPage extends StatefulWidget {
  const SubmitPage({super.key});

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage>
    with UserDao, ArticleDao, DeadlineDao {
  File? imageFile;
  File? wordFile;
  UserVO? loggedInUser;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    try {
      loggedInUser = getAllUsers()?.firstWhere((e) => e?.isLoggedIn ?? false);
    } catch (e) {
      print(e.toString());
    }
    super.initState();
  }

  Future<void> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String toEmail,
    required String message,
  }) async {
    final serviceId = 'service_3xn2d1t';
    final templateId = 'template_ulplfj9';
    final userId = 'ppkRQ7mtNoYYnDkHg';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final payload = {
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'user_name': name,
        'user_email': email,
        'to_email': toEmail,
        'user_subject': subject,
        'user_message': message,
      }
    };

    try {
      final response = await http.post(
        url,
        body: jsonEncode(payload),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print("✅ Email sent successfully.");
      } else {
        print("❌ Failed to send email. Status: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      print("❗Error sending email: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HoverAppBar(
        portal: "Student",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadBannerSection(portal: "Student"),
            ContributeTitleWidget(),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child:
                  Text('Key Submission Dates', style: AppTextStyle.h1iterBold),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                  'Stay informed about our article submission timeline.',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.h5iterBold),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              decoration: BoxDecoration(color: Colors.white),
              child: Wrap(
                direction: (rs.Device.screenType == rs.ScreenType.desktop ||
                        rs.Device.screenType == rs.ScreenType.tablet)
                    ? Axis.horizontal
                    : Axis.vertical,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  Image.network(
                    width: MediaQuery.sizeOf(context).width / 2.3,
                    fit: BoxFit.fitWidth,
                    "https://images.unsplash.com/photo-1605791767308-46f38113f418?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZGVhZGxpbmV8ZW58MHx8MHx8fDA%3D",
                  ),
                  SizedBox(width: 30),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2.3,
                    child: Column(
                      children: [
                        Text('Initial Submission Deadline',
                            style: AppTextStyle.h2iterBold),
                        SizedBox(height: 20),
                        Text(
                            'Please ensure your articles are submitted by this date to be considered for publication. Late submissions may not be accepted, so plan accordingly to meet this important deadline. We encourage early submissions to allow time for revisions.',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.h6iterBold),
                        SizedBox(height: 20),
                        Text(
                            getDeadline()?.firstFinalDate ??
                                (DateTime.now()
                                    .add(Duration(days: 7))
                                    .toString()
                                    .substring(0, 10)),
                            style: AppTextStyle.h3poppinsRegular),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              decoration: BoxDecoration(color: Colors.white),
              child: Wrap(
                direction: (rs.Device.screenType == rs.ScreenType.desktop ||
                        rs.Device.screenType == rs.ScreenType.tablet)
                    ? Axis.horizontal
                    : Axis.vertical,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2.3,
                    child: Column(
                      children: [
                        Text('Final Review Closure',
                            style: AppTextStyle.h2iterBold),
                        SizedBox(height: 20),
                        Text(
                            'This is the final date for any changes or edits to your submitted articles after the initial submission deadline. Authors can update their work to enhance clarity and quality until this date. Make sure to finalize your contributions before this point.',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.h6iterBold),
                        SizedBox(height: 20),
                        Text(
                            getDeadline()?.secondFinalDate ??
                                (DateTime.now()
                                    .add(Duration(days: 14))
                                    .toString()
                                    .substring(0, 10)),
                            style: AppTextStyle.h3poppinsRegular),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  Image.network(
                    width: MediaQuery.sizeOf(context).width / 2.3,
                    fit: BoxFit.fitWidth,
                    "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cmV2aWV3fGVufDB8fDB8fHww",
                  ),
                ],
              ),
            ),
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
                    Text('Submit Your Article',
                        style: AppTextStyle.h1iterBold
                            .copyWith(color: Colors.black)),
                    SizedBox(height: 20),
                    Text('We look forward to reviewing your work!',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.h5iterBold
                            .copyWith(color: Colors.black)),
                    SizedBox(height: 20),
                    TextField(
                      key: Key("1"),
                      style: TextStyle(color: Colors.black),
                      maxLines: 1,
                      controller: controller,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        label: Text(
                          "Article Title",
                          style: TextStyle(color: Colors.black),
                        ),
                        hintText: "Enter Your Article Title",
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      key: Key("2"),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (imageFile != null)
                                ? (imageFile!.name.split("/")).last
                                : "Add Article Cover Photo",
                            style: TextStyle(color: Colors.black),
                          ),
                          InkWell(
                            onTap: () async {
                              imageFile =
                                  await WordFileManager.pickImgFileFromDevice();
                              setState(() {});
                            },
                            child: Icon(
                              Icons.image,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      key: Key("3"),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
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
                    SizedBox(height: 20),
                    // MaterialButton(
                    //   color: AppColor.blueColor,
                    //   onPressed: () {
                    //     final deadline = getDeadline();
                    //     if (deadline == null || deadline.firstFinalDate == null)
                    //       return;
                    //
                    //     final firstFinalDate =
                    //         DateTime.tryParse(deadline.firstFinalDate!);
                    //     final today = DateTime.now();
                    //
                    //     // Optional: Handle invalid date parsing
                    //     if (firstFinalDate == null) return;
                    //
                    //     // Allow submit only if today is before or on the deadline
                    //     if (today.isBefore(firstFinalDate) ||
                    //         _isSameDate(today, firstFinalDate)) {
                    //       // Submit logic here
                    //       print("Submitted!");
                    //     } else {
                    //       // Too late
                    //       print("Submission deadline has passed.");
                    //     }
                    //   },
                    //   child: Text(
                    //     "Submit",
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
                    MaterialButton(
                      color: AppColor.blueColor,
                      onPressed: () async {
                        final deadline = getDeadline();
                        if (deadline == null ||
                            deadline.firstFinalDate == null) {
                          Fluttertoast.showToast(msg: "Something went wrong");
                        }
                        final firstFinalDate =
                            DateTime.tryParse(deadline?.firstFinalDate ?? "");
                        final today = DateTime.now();

                        if (firstFinalDate == null) return;
                        if (today.isBefore(firstFinalDate) ||
                            _isSameDate(today, firstFinalDate)) {
                          if (wordFile != null &&
                              imageFile != null &&
                              loggedInUser != null) {
                            var doc = ArticleVO(
                                id: DateTime.now()
                                    .microsecondsSinceEpoch
                                    .toString(),
                                studentId: loggedInUser?.id,
                                facultyId: loggedInUser?.facultyId,
                                title: controller.text,
                                wordBytes: await WordFileManager
                                    .convertFileToUnit8List(wordFile!),
                                imgBytes: await WordFileManager
                                    .convertFileToUnit8List(imageFile!),
                                date:
                                    DateTime.now().toString().substring(0, 10));

                            saveArticle(doc);
                            var user = getAllUsers();
                            final coordinator = user?.firstWhere(
                              (user) =>
                                  user?.facultyId == loggedInUser?.facultyId &&
                                  user?.role == "Coordinator",
                              orElse: () => UserVO(
                                  id: "",
                                  name: "",
                                  email: "",
                                  facultyId: "",
                                  role: ""),
                            );
                            sendEmail(
                                name: loggedInUser?.name ?? "",
                                email: loggedInUser?.email ?? "",
                                subject: "Article Submission",
                                message: "Article Submitted",
                                toEmail: coordinator?.email ?? "");
                            Fluttertoast.showToast(
                                msg: "Article Submitted Successfully");
                            Get.to(() => MySubmissionsPage());
                          } else {
                            Fluttertoast.showToast(msg: "Fields Required!");
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg: "  Submission deadline has passed.");
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

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool isDeadlinePassed() {
    final deadline = getDeadline();
    final firstDate = DateTime.tryParse(deadline?.firstFinalDate ?? '');
    final today = DateTime.now();

    if (firstDate == null) return true;

    return today.isAfter(firstDate);
  }
}
