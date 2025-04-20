import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_zoom_image.dart';

class ThirdRowSection extends StatelessWidget {
  const ThirdRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      decoration: BoxDecoration(color: AppColor.greyBGColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Announcement",
                  style: AppTextStyle.h1poppinsBold
                      .copyWith(fontSize: 30, color: AppColor.blackColor),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 100,
                  height: 3,
                  color: AppColor.hoverAppBarColor,
                ),
                const SizedBox(height: 12),
                Text(
                  "Stay informed about the latest happenings at UOG. From groundbreaking research discoveries to exciting campus events, we capture it all.",
                  style: AppTextStyle.h4poppinsRegular,
                ),
                const SizedBox(height: 20),
                // MaterialButton(
                //   minWidth: 100,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   hoverColor: AppColor.hoverAppBarColor,
                //   padding: const EdgeInsets.all(18),
                //   color: AppColor.blueColor,
                //   onPressed: () {},
                //   child: Row(
                //     mainAxisSize:
                //         MainAxisSize.min, // Prevents unnecessary stretching
                //     children: [
                //       Text(
                //         "More News",
                //         style: AppTextStyle.h5poppinsRegular
                //             .copyWith(color: AppColor.whiteColor),
                //       ),
                //       if (Device.screenType == ScreenType.tablet ||
                //           Device.screenType == ScreenType.desktop)
                //         const SizedBox(width: 8),
                //       if (Device.screenType == ScreenType.tablet ||
                //           Device.screenType == ScreenType.desktop)
                //         const Icon(Icons.arrow_forward_outlined,
                //             color: Colors.white),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(width: 20), // Adds spacing between text and news list
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 500,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Row(
                  children: [
                    AnnouncementWidget(
                      image:
                          "https://images.unsplash.com/photo-1623039405147-547794f92e9e?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXJ0aWNsZXxlbnwwfHwwfHx8MA%3D%3D",
                    ),
                    AnnouncementWidget(
                      des: "A partnership between the University of Greenwich and the KMD College, the top up degree will be achieved better outcomes for Student communities.",
                      image:
                          "https://images.unsplash.com/photo-1476242906366-d8eb64c2f661?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YXJ0aWNsZXxlbnwwfHwwfHx8MA%3D%3D",
                    ),
                    AnnouncementWidget(
                      des: "The University of Greenwich is an authentic environment.Their research team in various scientific fields will lead the future",
                      image:
                          "https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGFydGljbGV8ZW58MHx8MHx8fDA%3D",
                    ),
                  ],
                ),
              ),
              // Constrains ListView's height
              // child: ListView.builder(
              //   itemCount: 3,
              //   scrollDirection: Axis.horizontal, // Allows horizontal scrolling
              //   itemBuilder: (context, index) {
              //     return Container(
              //       margin: const EdgeInsets.symmetric(horizontal: 20),
              //       width: 310,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           HoverZoomImage(
              //             imageUrl:
              //                 "https://images.unsplash.com/photo-1586339949916-3e9457bef6d3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           Row(
              //             children: [
              //               SizedBox(
              //                 width: 5,
              //               ),
              //               CircleAvatar(
              //                 maxRadius: 2,
              //                 backgroundColor: AppColor.blackColor,
              //               ),
              //               SizedBox(
              //                 width: 8,
              //               ),
              //               Text("March 14 2025",
              //                   style: AppTextStyle.h5poppinsRegular.copyWith(
              //                       color:
              //                           AppColor.blackColor.withOpacity(0.7))),
              //             ],
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           Text(
              //               "UAB Comprehensive Snakebite Program is one of few in the state to offer snakebite care in an outpatient setting",
              //               maxLines: 5,
              //               overflow: TextOverflow.ellipsis,
              //               style: AppTextStyle.h2poppinsRegular
              //                   .copyWith(color: AppColor.blackColor)),
              //         ],
              //       ),
              //     );
              //   },
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnnouncementWidget extends StatelessWidget {
  final String image, date, des;
  const AnnouncementWidget({
    super.key,
    required this.image,
    this.date = "March 14 2025",
    this.des =
        "UOG Comprehensive Snakebite Program is one of few in the state to offer snakebite care in an outpatient setting",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: 310,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HoverZoomImage(
            imageUrl: image,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                maxRadius: 2,
                backgroundColor: AppColor.blackColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(date,
                  style: AppTextStyle.h5poppinsRegular
                      .copyWith(color: AppColor.blackColor.withOpacity(0.7))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(des,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.h2poppinsRegular
                  .copyWith(color: AppColor.blackColor)),
        ],
      ),
    );
  }
}
