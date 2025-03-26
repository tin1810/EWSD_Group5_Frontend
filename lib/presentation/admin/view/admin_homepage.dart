import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/admin/view/system_settings.dart';
import 'package:university_magazine_project/presentation/admin/view/user_management.dart';
import 'package:university_magazine_project/presentation/admin/view/widget/side_appbar.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/banner_imagewith_text.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      // drawer: Drawer(
      //   backgroundColor: Colors.white,
      //   child: ListView(
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(color: Colors.blue),
      //         child: Text('Admin Panel',
      //             style: TextStyle(color: Colors.white, fontSize: 24)),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.dashboard),
      //         title: Text('Dashboard'),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.table_chart),
      //         title: Text('Tables'),
      //         onTap: () {},
      //       ),
      //     ],
      //   ),
      // ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   leading: Text("Admin"),
      //   // leading: Row(
      //   //   children: [
      //   //     Builder(
      //   //       builder: (context) => IconButton(
      //   //         icon: Icon(
      //   //           Icons.menu,
      //   //           color: AppColor.whiteColor,
      //   //         ),
      //   //         onPressed: () => Scaffold.of(context).openDrawer(),
      //   //       ),
      //   //     ),
      //   //   ],
      //   // ),
      //   title: Image.asset(AppGraphic.logoImage, height: 60),
      //   backgroundColor: AppColor.whiteColor,
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.logout,
      //         color: AppColor.blueColor,
      //         size: 30,
      //       ),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: Row(
        children: [
          SideAppBar(),
          Expanded(
            child: Column(
              children: [
                Image.asset(AppGraphic.logoImage, height: 100),
                _buildStatCard('Earnings (Monthly)', '\$40,000',
                    Icons.calendar_today, Colors.orange),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     _buildStatCard('Earnings (Monthly)', '\$40,000',
                //         Icons.calendar_today, Colors.orange),
                //     _buildStatCard(
                //         'Sales', '650', Icons.shopping_cart, Colors.green),
                //     _buildStatCard('New Users', '366', Icons.person, Colors.blue),
                //     _buildStatCard(
                //         'Pending Requests', '18', Icons.chat, Colors.red),
                //   ],
                // ),
                SizedBox(height: 20),
                Expanded(
                  child: Center(
                    child: Text('Chart and other widgets go here'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildStatCard(String title, String value, IconData icon, Color color) {
  return Card(
    elevation: 2,
    child: Container(
      width: 150,
      height: 100,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              SizedBox(width: 10),
              Text(value,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    ),
  );
}
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


