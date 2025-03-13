import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/banner_image_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/firstrow_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';

import 'widget/head_banner_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HoverAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeadBannerSection(),
            BannerImageSection(),
            SizedBox(
              height: 150,
            ),
            FirstRowSection(),
          ],
        ),
      ),
    );
  }
}
