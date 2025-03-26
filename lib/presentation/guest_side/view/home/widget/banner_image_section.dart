import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as rs;
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/guest_side/controller/home_controller.dart';

class BannerImageSection extends StatelessWidget {
  const BannerImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final CarouselSliderController carouselController =
        CarouselSliderController(); // Controller for navigation

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          carouselController: carouselController, // Assign controller
          options: CarouselOptions(
            height: 500,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
          ),
          items: homeController.imageUrlsForBanners.map((url) {
            return Container(
              width: double.infinity,
              // margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),

        // Left Arrow Button
        Positioned(
          left: 20,
          child: CircleAvatar(
            backgroundColor: AppColor.whiteColor.withOpacity(0.8),
            child: Center(
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
                onPressed: () {
                  carouselController.previousPage();
                },
              ),
            ),
          ),
        ),

        // Right Arrow Button
        Positioned(
          right: 20,
          child: CircleAvatar(
            backgroundColor: AppColor.whiteColor.withOpacity(0.8),
            child: Center(
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios,
                    color: Colors.black, size: 20),
                onPressed: () {
                  carouselController.nextPage();
                },
              ),
            ),
          ),
        ),

        Positioned(
          bottom: -100,
          left: (rs.Device.screenType == rs.ScreenType.tablet ||
                  rs.Device.screenType == rs.ScreenType.desktop)
              ? MediaQuery.sizeOf(context).width / 4
              : 20,
          right: (rs.Device.screenType == rs.ScreenType.tablet ||
                  rs.Device.screenType == rs.ScreenType.desktop)
              ? MediaQuery.sizeOf(context).width / 4
              : 20,
          child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.circular(5),
              color: AppColor.whiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome to University of Greenwich',
                    style: AppTextStyle.h1iterBold
                        .copyWith(fontSize: 36, color: AppColor.blueColor)),
                SizedBox(height: 20),
                Text(
                    'We are an ambitious community of students and academics with no limits on where you come from\n and no limits on what you can do next. Our three campuses in London and Kent are where\n minds meet, ideas spark, and new adventures begin.',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.h5iterBold),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
