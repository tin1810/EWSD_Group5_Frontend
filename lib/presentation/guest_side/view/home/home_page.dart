import 'package:flutter/material.dart';
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
