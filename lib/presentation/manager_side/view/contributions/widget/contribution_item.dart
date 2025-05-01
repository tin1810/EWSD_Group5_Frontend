import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/app/populations/articles.dart';

class ContributionItem extends StatelessWidget {
  final String? name;
  final String? date;
  final String? text;
  final Uint8List? imageUrl;
  final Color color;
  final Function onDownload;
  const ContributionItem({
    super.key,
    this.text,
    this.imageUrl,
    this.name,
    this.date,
    required this.color,
    required this.onDownload,
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
        children: [
          Image.memory(
            imageUrl ?? fakeBytes("hello world"),
            height: 170,
            width: 170,
            errorBuilder: (context, o, e) {
              return Image.asset(
                "assets/images/article_error.jpg",
                height: 170,
                width: 170,
              );
            },
            fit: BoxFit.cover,
          ),
          // Container(
          //   height: 400,
          //   width: MediaQuery.sizeOf(context).width / 2.4,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     image: DecorationImage(
          //       image: NetworkImage(
          //           "https://images.unsplash.com/photo-1523289333742-be1143f6b766?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          SizedBox(width: 40),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
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
                SizedBox(height: 20),
                Text(
                  overflow: TextOverflow.ellipsis,
                  text ?? "Submission Text",
                  textAlign: TextAlign.justify,
                  maxLines: 5,
                  style: AppTextStyle.h5iterRegular,
                ),
                SizedBox(height: 15),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hoverColor: AppColor.blueColor,
                  padding: EdgeInsets.all(18),
                  color: Colors.grey.shade400,
                  elevation: 0,
                  onPressed: () {
                    onDownload();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Download",
                        style: AppTextStyle.h5poppinsRegular
                            .copyWith(color: AppColor.whiteColor),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        FontAwesomeIcons.download,
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
