import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

import '../../../../../app/config/app_color.dart';

class SecondRowSection extends StatelessWidget {
  const SecondRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 120),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Meet our talented \nstudents and alumni",
                  style: AppTextStyle.h1iterBold
                      .copyWith(color: AppColor.whiteColor, fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 100,
                  height: 2,
                  color: AppColor.dividerColor,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "We celebrate the varied journeys of our community through our award-winning Greenwich portraits series.Get to know your future colleagues and discover their inspiring stories.",
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.h4iterRegular
                      .copyWith(color: AppColor.whiteColor, fontSize: 15),
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hoverColor: AppColor.hoverAppBarColor,
                  padding: EdgeInsets.all(18),
                  color: AppColor.blueColor,
                  onPressed: () {},
                  child: Text(
                    "Find Out More",
                    style: AppTextStyle.h5poppinsRegular
                        .copyWith(color: AppColor.whiteColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Image.network(
              height: 400,
              "https://images.unsplash.com/photo-1543269664-56d93c1b41a6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        ],
      ),
    );
  }
}
