import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class TableItem extends StatelessWidget {
  final String? name;
  final String? title;
  const TableItem({
    super.key,
    this.name,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name ?? "",
        ),
        Text(
          title ?? "",
          style: AppTextStyle.h6iterRegular,
        ),
      ],
    );
  }
}
