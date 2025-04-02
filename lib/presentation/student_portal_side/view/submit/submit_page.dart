import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/submit/widgets/contribute_title_widget.dart';

class SubmitPage extends StatefulWidget {
  const SubmitPage({super.key});

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  File? imageFile;
  File? wordFile;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
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
                direction: (Device.screenType == ScreenType.desktop ||
                        Device.screenType == ScreenType.tablet)
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
                direction: (Device.screenType == ScreenType.desktop ||
                        Device.screenType == ScreenType.tablet)
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
            SizedBox(height: 30),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              decoration: BoxDecoration(color: Colors.white),
              child: Wrap(
                direction: (Device.screenType == ScreenType.desktop ||
                        Device.screenType == ScreenType.tablet)
                    ? Axis.horizontal
                    : Axis.vertical,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  Image.network(
                    width: MediaQuery.sizeOf(context).width / 2.3,
                    fit: BoxFit.fitWidth,
                    "https://images.unsplash.com/photo-1504711434969-e33886168f5c?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHVibGljYXRpb258ZW58MHx8MHx8fDA%3D",
                  ),
                  SizedBox(width: 30),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2.3,
                    child: Column(
                      children: [
                        Text('Publication Date Announcement',
                            style: AppTextStyle.h2iterBold),
                        SizedBox(height: 20),
                        Text(
                            'Mark your calendars for the official publication date when accepted articles will be made available to our readers. Celebrate your contribution and see the impact of your work in our community. We look forward to sharing your ideas!',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.h6iterBold),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                width: (Device.screenType == ScreenType.desktop ||
                        Device.screenType == ScreenType.tablet)
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
                                ? (imageFile!.path.split("/")).last
                                : "Add Article Cover Photo",
                            style: TextStyle(color: Colors.black),
                          ),
                          InkWell(
                            onTap: () async {
                              var result = await FilePicker.platform.pickFiles(
                                type: FileType.image,
                                allowMultiple: false,
                              );
                              var platFormFile = result?.files.first;
                              if (platFormFile != null) {
                                setState(() {
                                  imageFile = File(platFormFile.path ?? "");
                                });
                              }
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
                                ? (wordFile!.path.split("/")).last
                                : "Add Article File(WORD)",
                            style: TextStyle(color: Colors.black),
                          ),
                          InkWell(
                            onTap: () async {
                              var result = await FilePicker.platform.pickFiles(
                                type: FileType.any,
                                allowMultiple: false,
                              );
                              var platFormFile = result?.files.first;
                              if (platFormFile != null) {
                                setState(() {
                                  wordFile = File(platFormFile.path ?? "");
                                });
                              }
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
                    // FacultyDropdownWidget(),
                    // SizedBox(height: 20),
                    MaterialButton(
                      color: AppColor.blueColor,
                      onPressed: () {},
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
