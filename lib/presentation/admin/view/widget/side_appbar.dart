import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class SideAppBar extends StatelessWidget {
  const SideAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 250,
      color: AppColor.primaryColor,
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Text("Admin Portal",
              style:
                  AppTextStyle.h1iterBold.copyWith(color: AppColor.whiteColor)),
          SizedBox(height: 50),
          SideBarItem(
            title: 'System Settings',
            icon: Icons.settings,
            onTap: () {},
          ),
          SizedBox(
            height: 15,
          ),
          SideBarItem(
            title: 'Users',
            icon: FontAwesomeIcons.users,
            onTap: () {},
          ),
          SizedBox(
            height: 15,
          ),
          SideBarItem(
            title: 'Logout',
            icon: Icons.logout,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SideBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const SideBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: double.infinity,
        hoverColor: AppColor.blueColor,
        color: AppColor.greyLightColor.withOpacity(0.3),
        height: 70,
        onPressed: () {
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: AppTextStyle.h4iterRegular
                    .copyWith(color: AppColor.whiteColor)),
            SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: AppColor.whiteColor,
            )
          ],
        ));
  }
}
