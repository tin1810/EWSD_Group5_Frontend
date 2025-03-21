import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class HeaderSectionTitle extends StatefulWidget {
  final String title;
  final Function? onTap;

  const HeaderSectionTitle({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  State<HeaderSectionTitle> createState() => _HeaderSectionTitleState();
}

class _HeaderSectionTitleState extends State<HeaderSectionTitle> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: SizedBox(
        width: 160,
        height: 60,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: () {
            if (widget.onTap != null) {
              widget.onTap!();
            }
          },
          elevation: 0,
          hoverElevation: 0.1,
          hoverColor: AppColor.blackColor,
          color: AppColor.whiteColor,
          child: Text(
            widget.title,
            style: AppTextStyle.h3iterRegular.copyWith(
              color: isHovered ? AppColor.whiteColor : AppColor.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
