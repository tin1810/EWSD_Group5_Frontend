import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';

class HomeController extends GetxController {
  var backgroundColor = AppColor.primaryColor.obs;
  final List<String> imageUrlsForBanners = [
    "https://images.unsplash.com/photo-1568792923760-d70635a89fdc?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/flagged/photo-1554473675-d0904f3cbf38?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1504817343863-5092a923803e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  ];
  void onHover(bool isHovered) {
    backgroundColor.value =
        isHovered ? AppColor.hoverAppBarColor : AppColor.primaryColor;
  }

  List<Map<String, dynamic>> socialIcons = [
    {'icon': FontAwesomeIcons.facebook, 'url': 'https://facebook.com'},
    {'icon': FontAwesomeIcons.snapchat, 'url': 'https://snapchat.com'},
    {'icon': FontAwesomeIcons.instagram, 'url': 'https://instagram.com'},
    {'icon': FontAwesomeIcons.youtube, 'url': 'https://youtube.com'},
    {'icon': FontAwesomeIcons.xTwitter, 'url': 'https://twitter.com'},
    {'icon': FontAwesomeIcons.linkedinIn, 'url': 'https://linkedin.com'},
  ];
}
