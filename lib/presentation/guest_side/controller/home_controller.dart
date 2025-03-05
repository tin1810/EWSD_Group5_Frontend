import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';

class HomeController extends GetxController {
  var backgroundColor = AppColor.primaryColor.obs;

  void onHover(bool isHovered) {
    backgroundColor.value =
        isHovered ? AppColor.hoverAppBarColor : AppColor.primaryColor;
  }
}
