import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';
import 'package:university_magazine_project/presentation/admin/view/widget/sidebar_item.dart';

class SideAppBar extends StatelessWidget {
  final Function onClicked;
  final double width;
  const SideAppBar({
    super.key,
    required this.onClicked,
    this.width = 250,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: width,
      color: AppColor.primaryColor,
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Admin Portal",
              style:
                  AppTextStyle.h1iterBold.copyWith(color: AppColor.whiteColor)),
          SizedBox(height: 50),
          SideBarItem(
            title: 'System Settings',
            icon: Icons.settings,
            section: AdminSection.system,
            onTap: () {
              onClicked(AdminSection.system);
            },
          ),
          SizedBox(
            height: 15,
          ),
          SideBarItem(
            title: 'Users',
            section: AdminSection.users,
            icon: FontAwesomeIcons.users,
            onTap: () {
              onClicked(AdminSection.users);
            },
          ),
          SizedBox(
            height: 15,
          ),
          SideBarItem(
            title: 'Faculty',
            icon: FontAwesomeIcons.school,
            section: AdminSection.faculty,
            onTap: () {
              onClicked(AdminSection.faculty);
            },
          ),
          SizedBox(
            height: 15,
          ),
          SideBarItem(
            title: 'Logout',
            icon: Icons.logout,
            section: AdminSection.logout,
            onTap: () {
              onClicked(AdminSection.logout);
            },
          ),
        ],
      ),
    );
  }
}
