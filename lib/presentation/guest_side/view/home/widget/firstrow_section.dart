import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class FirstRowSection extends StatelessWidget {
  const FirstRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
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
              SizedBox(width: 60),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Defined by Excellence and\nAchievement ",
                      style: AppTextStyle.h1iterBold.copyWith(fontSize: 27),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 100,
                      height: 3,
                      color: AppColor.hoverAppBarColor,
                    ),
                    SizedBox(height: 10),
                    Text(
                      """We celebrate the varied journeys of our community through our award-winning Greenwich portraits series.Get to know your future colleagues and discover their inspiring stories. Our university fosters an inclusive environment where innovation, creativity, and academic excellence thrive. We take pride in our students' and faculty's contributions to research, entrepreneurship, and social impact. From groundbreaking discoveries to transformational learning experiences, every journey at Greenwich is a step towards shaping a brighter future.""",
                      style: AppTextStyle.h4iterRegular,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {},
                      color: AppColor.whiteColor,
                      elevation: 0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Find Your Faculty",
                            style: AppTextStyle.h3iterRegular,
                          ),
                          CircleAvatar(
                            backgroundColor: AppColor.greyLightColor,
                            maxRadius: 15,
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              size: 20,
                              color: AppColor.blackColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      indent: 10,
                      color: AppColor.blackColor.withOpacity(0.3),
                    )
                    // Text("Find Your Faculty",
                    //     style: AppTextStyle.h3iterRegular),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
