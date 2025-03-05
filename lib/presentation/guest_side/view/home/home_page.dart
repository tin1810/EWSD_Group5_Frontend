import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/guest_side/controller/home_controller.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';

import 'widget/head_banner_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HoverAppBar(),
      body: Column(
        children: [HeadBannerSection()],
      ),
    );
  }
}
