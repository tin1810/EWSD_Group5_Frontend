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
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.memory(
            imageUrl ?? fakeBytes("hello world"),
            height: 170,
            width: 170,
            fit: BoxFit.cover,
            errorBuilder: (context, o, e) {
              return Image.asset(
                "assets/images/article_error.jpg",
                height: 170,
                width: 170,
                fit: BoxFit.cover,
              );
            },
          ),
          const SizedBox(width: 40),
          // Expanded is now correctly used inside Row
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name ?? "Student Name",
                      style: AppTextStyle.h3iterBold,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      date ?? "Submission Date",
                      style: AppTextStyle.h5iterRegular,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  text ?? "Submission Text",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.h5iterRegular,
                ),
                const SizedBox(height: 15),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hoverColor: AppColor.blueColor,
                  padding: const EdgeInsets.all(18),
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
                      const SizedBox(width: 10),
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
