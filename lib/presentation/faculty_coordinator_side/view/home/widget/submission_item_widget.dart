import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class SubmissionItemWidget extends StatelessWidget {
  final String? name;
  final String? date;
  final String? text;
  final Uint8List imageUrl;
  final Color color;
  final Function viewDetail;
  final bool isCommented,isPublish;
  const SubmissionItemWidget({
    super.key,
    this.text,
    required this.imageUrl,
    this.name,
    this.date,
    required this.color,
    required this.viewDetail,
    this.isPublish = false,
    this.isCommented = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.end,
        spacing: 40,
        runSpacing: 30,
        direction: Axis.horizontal,
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1581094271901-8022df4466f9?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  image: DecorationImage(
                    image: MemoryImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name ?? "Student Name",
                      style: AppTextStyle.h3iterBold,
                    ),
                    SizedBox(width: 30),
                    Text(
                      date ?? "Submission Date",
                      style: AppTextStyle.h5iterRegular,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  overflow: TextOverflow.ellipsis,
                  text ?? "Submission Text",
                  maxLines: 3,
                  style: AppTextStyle.h5iterRegular,
                ),
                SizedBox(height: 10),
                if (isCommented)
                  Row(
                    children: [
                      Icon(
                        Icons.message_outlined,
                        size: 14,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "You've commented",
                        style: AppTextStyle.h5poppinsRegular
                            .copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                SizedBox(height: 15),
                if(!isPublish)
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hoverColor: AppColor.blueColor,
                  padding: EdgeInsets.all(18),
                  color: Colors.grey.shade400,
                  elevation: 0,
                  onPressed: () {
                    viewDetail();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "View Details",
                        style: AppTextStyle.h5poppinsRegular
                            .copyWith(color: AppColor.whiteColor),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        FontAwesomeIcons.arrowRight,
                        color: AppColor.whiteColor,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
