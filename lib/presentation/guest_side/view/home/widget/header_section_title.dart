import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class HeaderSectionTitle extends StatelessWidget {
  final String title;
  const HeaderSectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) => true,
        onExit: (_) => false,
        child: MaterialButton(
            onPressed: () {},
            color: AppColor.hoverAppBarColor,
            child: Text(title, style: AppTextStyle.h4poppinsRegular)));
  }
}
