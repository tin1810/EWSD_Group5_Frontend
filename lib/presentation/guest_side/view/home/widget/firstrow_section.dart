import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class FirstRowSection extends StatelessWidget {
  const FirstRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Discover the University of Greenwich",
          //   style: AppTextStyle.h1iterBold
          //       .copyWith(fontSize: 30, color: AppColor.primaryColor),
          // ),
          // SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SizedBox(width: 70),
              Image.network(
                  height: 300,
                  width: 450,
                  fit: BoxFit.cover,
                  "https://images.unsplash.com/photo-1571260899304-425eee4c7efc?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Defined by Excellence\nand Achievement ",
                    style: AppTextStyle.h3iterBold,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 60,
                    height: 3,
                    color: Colors.cyan,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "We celebrate the varied journeys of our community through our award-winning Greenwich portraits series. \n"
                    "Get to know your future colleagues and discover their inspiring stories. Our university fosters an inclusive  \n"
                    "environment where innovation, creativity, and academic excellence thrive. We take pride in our students' and  \n"
                    "faculty's contributions to research, entrepreneurship, and social impact. From groundbreaking discoveries to  \n"
                    "transformational learning experiences, every journey at Greenwich is a step towards shaping a brighter future.",
                    style: AppTextStyle.h3iterBold,
                    textAlign: TextAlign.start,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
