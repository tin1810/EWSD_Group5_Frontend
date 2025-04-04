import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
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

class _PublishionPageState extends State<PublishionPage> {
  final List<bool> _selectedItems = List.generate(5, (index) => false);

  void _toggleSelection(int index) {
    setState(() {
      _selectedItems[index] = !_selectedItems[index];
    });
  }

  bool get _isAnySelected => _selectedItems.contains(true);

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
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _toggleSelection(index),
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
                                value: _selectedItems[index],
                                onChanged: (bool? value) {
                                  _toggleSelection(index);
                                },
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: SubmissionItemWidget(
                                  name: "Rose",
                                  date: "12/12/2021",
                                  text:
                                      "Access a comprehensive list of all contributions submitted by students within the Computer Science Faculty.",
                                  color: _selectedItems[index]
                                      ? AppColor.blueColor.withOpacity(0.6)
                                      : Colors.grey.shade200,
                                  viewDetail: () {
                                    Get.to(()=>ArticleDetailPage());
                                  },
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
                      onPressed:
                          _isAnySelected ? () => print("Publishing...") : null,
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
