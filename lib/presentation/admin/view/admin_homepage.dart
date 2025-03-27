import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';
import 'package:university_magazine_project/presentation/admin/view/system_settings.dart';
import 'package:university_magazine_project/presentation/admin/view/user_management.dart';
import 'package:university_magazine_project/presentation/admin/view/widget/side_appbar.dart';
import 'package:university_magazine_project/presentation/admin/view/widget/systemcard.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/banner_imagewith_text.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminController adminController = Get.find<AdminController>();
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Row(
        children: [
          SideAppBar(
            onClicked: (AdminSection section) {
              adminController.changeSection(section);
            },
          ),
          Expanded(
            child: Obx(() {
              switch (adminController.selectedSection.value) {
                case AdminSection.system:
                  return SystemSetting();
                case AdminSection.users:
                  return UserManagement();
                case AdminSection.logout:
                  return UserManagement();
              }
            }),
          ),
        ],
      ),
    );
  }
}


// Widget _buildStatCard(String title, String value, IconData icon, Color color) {
  // return Card(
  //   elevation: 2,
  //   child: Container(
  //     width: 150,
  //     height: 100,
  //     padding: EdgeInsets.all(16),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           children: [
  //             Icon(icon, color: color),
  //             SizedBox(width: 10),
  //             Text(value,
  //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //           ],
  //         ),
  //         SizedBox(height: 10),
  //         Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
  //       ],
  //     ),
  //   ),
  // );
// }
//     return Scaffold(
//         backgroundColor: AppColor.whiteColor,
//         appBar: HoverAppBar(portal: "Admin"),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               HeadBannerSection(
//                 portal: "Admin",
//               ),
//               BannerImageWithTextWidget(
//                 imagePath: AppGraphic.managerBG,
//                 title: "Welcome to Admin Portal",
//                 isManager: true,
//               ),


//               FooterSection(),
//             ],
//           ),
//         ));
//   }
// }
    // return Scaffold(
    //   backgroundColor: AppColor.whiteColor,
    //   appBar: HoverAppBar(portal: "Admin"),
    //   body: Column(
    //     children: [
    //       SystemSettings(),
    //       UserManagement(),
    //     ],
    //   ),
    // );


