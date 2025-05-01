import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/faculty_dao.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/guest_side/view/faulty/widget/faculty_card.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';

class FacultyPage extends StatefulWidget  {
  const FacultyPage({super.key});

  @override
  State<FacultyPage> createState() => _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> with FacultyDao,UserDao{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HoverAppBar(
        portal: "Portal",

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadBannerSection(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Text(
                'Faculty',
                style: AppTextStyle.h1poppinsBold.copyWith(
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                  "Learn more about the courses we offer, and find out how to make an application to join us.",
                  style: AppTextStyle.h3poppinsRegular),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 500,
              width: double.infinity,
              // margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1506377872008-6645d9d29ef7?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
                child: Text("Directory",
                    style: AppTextStyle.h1poppinsBold.copyWith(fontSize: 27))),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Expanded(
                child: Text(
                    "Find contact details, locations, news, events and other information about our departments.",
                    style: AppTextStyle.h4poppinsRegular),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 120,
                height: 10,
                color: AppColor.blueColor,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 220,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return FaultyCard(
                      name: getAllFaculty()?[index]?.name,
                      text: getAllFaculty()?[index]?.description,
                    );
                  }),
            ),
            SizedBox(
              height: 50,
            ),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
