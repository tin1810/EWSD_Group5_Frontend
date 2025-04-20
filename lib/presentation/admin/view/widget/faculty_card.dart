import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class FacultyCard extends StatelessWidget {
  final String? name;
  final String? des;
  const FacultyCard({
    super.key,
    this.name,
    this.des,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: 250,

      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          border:
              Border.all(color: AppColor.blackColor.withOpacity(0.2), width: 1),
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              // CircleAvatar(
              //   backgroundColor: Colors.purple.shade100,
              //   backgroundImage: NetworkImage(
              //       "https://images.unsplash.com/photo-1610563166150-b34df4f3bcd6?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              // ),
              // SizedBox(
              //   width: 10,
              // ),
              Expanded(
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
                      style: AppTextStyle.h5iterRegular.copyWith(
                          color: AppColor.blackColor.withOpacity(0.8)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
