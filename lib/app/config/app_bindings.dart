import 'package:get/get.dart';
import 'package:university_magazine_project/presentation/guest_side/controller/home_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
