import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/submit/widgets/contribute_title_widget.dart';

class SubmitPage extends StatelessWidget {
  const SubmitPage({super.key});

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
            SizedBox(height: 20),
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
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
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
              child: Row(
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
                    "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Image.network(
                    width: MediaQuery.sizeOf(context).width / 2.3,
                    fit: BoxFit.fitWidth,
                    "https://images.unsplash.com/photo-1585241936939-be4099591252?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGFydGljbGUlMjBwdWJsaXNoJTIwZGF0ZXxlbnwwfHwwfHx8MA%3D%3D",
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
                width: MediaQuery.sizeOf(context).width / 2,
                decoration: BoxDecoration(
                  color: Colors.black38,
                ),
                child: Column(
                  children: [
                    Text('Submit Your Article',
                        style: AppTextStyle.h1iterBold
                            .copyWith(color: Colors.white)),
                    SizedBox(height: 20),
                    Text('We look forward to reviewing your work!',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.h5iterBold
                            .copyWith(color: Colors.white)),
                    SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                      controller: TextEditingController(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your article title';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text(
                          "Article Title",
                          style: TextStyle(color: Colors.white),
                        ),
                        hintText: "Enter Your Article Title",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
