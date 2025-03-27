import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class Systemcard extends StatelessWidget {
  final String title, value;
  final IconData icon;
  final Color color;
  final Function onClicked;
  const Systemcard(
      {super.key,
      required this.title,
      required this.value,
      required this.icon,
      required this.color,
      required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.sizeOf(context).width / 3,
      // height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              SizedBox(width: 10),
              Text(
                title,
                style: AppTextStyle.h3iterBold.copyWith(color: color),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value, style: AppTextStyle.h4iterRegular),
              IconButton(
                  onPressed: () {
                    onClicked();
                  },
                  icon: Icon(
                    FontAwesomeIcons.edit,
                    color: Colors.red,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
