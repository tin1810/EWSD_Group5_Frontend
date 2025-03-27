import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class TitleTableRow extends StatelessWidget {
  const TitleTableRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 3, child: Text('Name', style: AppTextStyle.h4iterRegular)),
        Expanded(
            flex: 3, child: Text("Role", style: AppTextStyle.h4iterRegular)),
        Expanded(
            flex: 2, child: Text("Status", style: AppTextStyle.h4iterRegular)),
        // Expanded(child: SizedBox()),
        Expanded(
            flex: 2, child: Text("Action", style: AppTextStyle.h4iterRegular)),
      ],
    );
  }
}
