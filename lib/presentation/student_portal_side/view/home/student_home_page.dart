import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/banner_image_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/home/widgets/student_home_information_widget.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage>with UserDao {
  UserVO? loggedInUser;
  @override
  void initState() {
    try {
      loggedInUser = getAllUsers()?.firstWhere((e) => e?.isLoggedIn ?? false);
    } catch (e) {
      print(e.toString());
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HoverAppBar(
        portal: "Student",
        userVO: loggedInUser,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeadBannerSection(portal: "Student"),
            BannerImageSection(),
            SizedBox(
              height: 120,
            ),
            StudentHomeInformationWidget(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
