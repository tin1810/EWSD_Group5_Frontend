import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/admin/view/admin_homepage.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/faculty_coordinator_homepage.dart';
import 'package:university_magazine_project/presentation/guest_side/controller/home_controller.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/banner_image_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/firstrow_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/secondrow_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/thirdrow_section.dart';

import 'widget/head_banner_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with UserDao {
  final HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HoverAppBar(
        portal: "Portal",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeadBannerSection(),
            BannerImageSection(),
            SizedBox(
              height: 150,
            ),
            FirstRowSection(),
            SizedBox(
              height: 50,
            ),
            SecondRowSection(),
            SizedBox(
              height: 50,
            ),
            ThirdRowSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
