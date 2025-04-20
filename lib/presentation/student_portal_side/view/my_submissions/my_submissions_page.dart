import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/my_submissions/widgets/submitted_article.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/submit/widgets/contribute_title_widget.dart';

class MySubmissionsPage extends StatelessWidget {
  const MySubmissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HoverAppBar(
        portal: "Student",
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
              children: [
                SubmittedArticle(
                  image:
                      "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
                  title: "The Future of Sustainable Energy",
                  date: "March 6, 2025",
                  comments: "0",
                ),
                SubmittedArticle(
                  image:
                      "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
                  title: "The Future of Sustainable Energy",
                  date: "March 6, 2025",
                  comments: "0",
                ),
                SubmittedArticle(
                  image:
                      "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
                  title: "The Future of Sustainable Energy",
                  date: "March 6, 2025",
                  comments: "0",
                ),
              ],
            ),
            SizedBox(height: 20),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}


