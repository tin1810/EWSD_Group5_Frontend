import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class FacultyCard extends StatelessWidget {
  final String? name;
  final String? des;
  final Function onTap,onDelete;
  const FacultyCard({
    super.key,
    this.name,
    this.des,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: 250,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
              border: Border.all(
                  color: AppColor.blackColor.withOpacity(0.2), width: 1),
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? "Faculty Name",
                style: AppTextStyle.h4iterBold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                des ?? "Description",
                style: AppTextStyle.h5iterRegular
                    .copyWith(color: AppColor.blackColor.withOpacity(0.8)),
              ),
            ],
          ),
        ),
      SizedBox(
        width: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                onTap();
              },
              child: Icon(Icons.edit),
            ),

            InkWell(
              onTap: (){
                onDelete();
              },
              child: Icon(Icons.delete_outlined),
            ),
          ],
        ),
      )
      ],
    );
  }
}
