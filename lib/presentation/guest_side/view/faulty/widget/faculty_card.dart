import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class FaultyCard extends StatelessWidget {
  final String? name, text;
  const FaultyCard({
    super.key,
    this.name,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: 400,
      decoration: BoxDecoration(
        color: AppColor.greyBGColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name ?? "",
                style: AppTextStyle.h3poppinsBold,
              ),
              Icon(FontAwesomeIcons.userGraduate),
            ],
          ),
          Divider(
            color: AppColor.dividerColor,
          ),
          Text(
            text ?? "",
            style: AppTextStyle.h5poppinsRegular,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
