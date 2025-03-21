import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/my_submissions/my_submission_detail_page.dart';

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
            Text("Track Your Submission",
                style: AppTextStyle.h1iterBold.copyWith(color: Colors.black)),
            SizedBox(height: 20),
            Text(
                "Stay informed about the status of your article submissions with our easy-to-use tracking tool.",
                textAlign: TextAlign.center,
                style: AppTextStyle.h5iterBold.copyWith(color: Colors.black)),
            SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return MySubmissionDetailPage();
                    }));
                  },
                  child: SizedBox(
                    width: (MediaQuery.sizeOf(context).width / 4),
                    child: Column(
                      children: [
                        Image.network(
                          "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
                        ),
                        SizedBox(height: 10),
                        Text('The Future of Sustainable Energy',
                            style: AppTextStyle.h2iterBold
                                .copyWith(color: Colors.black)),
                        SizedBox(height: 10),
                        Text('March 6, 2025',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.h4iterBold
                                .copyWith(color: Colors.black)),
                        SizedBox(height: 10),
                        Text('0 comments',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.h5iterBold
                                .copyWith(color: Colors.grey))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.sizeOf(context).width / 4),
                  child: Column(
                    children: [
                      Image.network(
                        "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
                      ),
                      SizedBox(height: 10),
                      Text('The Future of Sustainable Energy',
                          style: AppTextStyle.h2iterBold
                              .copyWith(color: Colors.black)),
                      SizedBox(height: 10),
                      Text('March 6, 2025',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h4iterBold
                              .copyWith(color: Colors.black)),
                      SizedBox(height: 10),
                      Text('0 comments',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h5iterBold
                              .copyWith(color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.sizeOf(context).width / 4),
                  child: Column(
                    children: [
                      Image.network(
                        "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
                      ),
                      SizedBox(height: 10),
                      Text('The Future of Sustainable Energy',
                          style: AppTextStyle.h2iterBold
                              .copyWith(color: Colors.black)),
                      SizedBox(height: 10),
                      Text('March 6, 2025',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h4iterBold
                              .copyWith(color: Colors.black)),
                      SizedBox(height: 10),
                      Text('0 comments',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h5iterBold
                              .copyWith(color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.sizeOf(context).width / 4),
                  child: Column(
                    children: [
                      Image.network(
                        "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
                      ),
                      SizedBox(height: 10),
                      Text('The Future of Sustainable Energy',
                          style: AppTextStyle.h2iterBold
                              .copyWith(color: Colors.black)),
                      SizedBox(height: 10),
                      Text('March 6, 2025',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h4iterBold
                              .copyWith(color: Colors.black)),
                      SizedBox(height: 10),
                      Text('0 comments',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h5iterBold
                              .copyWith(color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.sizeOf(context).width / 4),
                  child: Column(
                    children: [
                      Image.network(
                        "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
                      ),
                      SizedBox(height: 10),
                      Text('The Future of Sustainable Energy',
                          style: AppTextStyle.h2iterBold
                              .copyWith(color: Colors.black)),
                      SizedBox(height: 10),
                      Text('March 6, 2025',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h4iterBold
                              .copyWith(color: Colors.black)),
                      SizedBox(height: 10),
                      Text('0 comments',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h5iterBold
                              .copyWith(color: Colors.grey))
                    ],
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.sizeOf(context).width / 4),
                  child: Column(
                    children: [
                      Image.network(
                        "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
                      ),
                      SizedBox(height: 10),
                      Text('The Future of Sustainable Energy',
                          style: AppTextStyle.h2iterBold
                              .copyWith(color: Colors.black)),
                      SizedBox(height: 10),
                      Text('March 6, 2025',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h4iterBold
                              .copyWith(color: Colors.black)),
                      SizedBox(height: 10),
                      Text('0 comments',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h5iterBold
                              .copyWith(color: Colors.grey))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
