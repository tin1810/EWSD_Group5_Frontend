import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/faculty_coordinator_homepage.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/publishion/publishion_page.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/report/report_page.dart';
import 'package:university_magazine_project/presentation/guest_side/view/faulty/faulty_page.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/home_page.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/header_section_title.dart';
import 'package:university_magazine_project/presentation/manager_side/view/contributions/manager_contribution_page.dart';
import 'package:university_magazine_project/presentation/manager_side/view/home/manager_homepage.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/home/student_home_page.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/my_submissions/my_submissions_page.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/submit/submit_page.dart';

class HeadBannerSection extends StatelessWidget {
  final String? portal;
  const HeadBannerSection({super.key, this.portal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        SizedBox(width: MediaQuery.sizeOf(context).width),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: (Device.screenType == ScreenType.tablet ||
                    Device.screenType == ScreenType.desktop)
                ? 80
                : 60,
            child: Image.asset(AppGraphic.logoImage, fit: BoxFit.cover),
          ),
        ),
        if (portal == null) _buildGuestMenu(context),
        if (portal == "Student") _buildStudentMenu(context),
        if (portal == "Coordinator") _buildFacultyCoordinatorMenu(context),
        if (portal == "Manager") _buildManagerMenu(context),
        // if (portal == "Admin") _buildAdminMenu(context),
      ],
    );
  }

  Widget _buildGuestMenu(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      child: Wrap(
        alignment: WrapAlignment.start,
        direction: (Device.screenType == ScreenType.desktop ||
                Device.screenType == ScreenType.tablet)
            ? Axis.horizontal
            : Axis.vertical,
        children: [
          _menuItem('Home', onTap: () => _navigateTo(context, HomePage())),
        //  _menuItem('Article'),
          _menuItem('Faculty',
              onTap: () => _navigateTo(context, FacultyPage())),
         // _menuItem('About Us'),
        ],
      ),
    );
  }

  // Widget _buildAdminMenu(BuildContext context, {Function(String)? onSelect}) {
  //   return Wrap(
  //     alignment: WrapAlignment.start,
  //     direction: (Device.screenType == ScreenType.desktop ||
  //             Device.screenType == ScreenType.tablet)
  //         ? Axis.horizontal
  //         : Axis.vertical,
  //     children: [
  //       _menuItem('System Settings', onTap: () {
  //         if (onSelect != null) {
  //           onSelect("System Settings");
  //         }
  //         // _navigateTo(
  //         //   context,
  //         //   // SystemSettings(),
  //         // );
  //       }),
  //       _menuItem('User', onTap: () {
  //         if (onSelect != null) {
  //           onSelect("User");
  //         }
  //         // _navigateTo(context, UserManagement());
  //       }),
  //     ],
  //   );
  // }

  Widget _buildManagerMenu(BuildContext context, {Function(String)? onSelect}) {
    return Wrap(
      alignment: WrapAlignment.start,
      direction: (Device.screenType == ScreenType.desktop ||
              Device.screenType == ScreenType.tablet)
          ? Axis.horizontal
          : Axis.vertical,
      children: [
        _menuItem('Home', onTap: () {
          if (onSelect != null) {
            onSelect("Home");
          }
          _navigateTo(
            context,
            ManagerHomepage(),
          );
        }),
        _menuItem('Contributions', onTap: () {
          if (onSelect != null) {
            onSelect("Contributions");
          }
          _navigateTo(context, ManagerContributionPage());
        }),
        // _menuItem('Reports', onTap: () {
        //   if (onSelect != null) {
        //     onSelect("Reports");
        //   }
        //   _navigateTo(context, ReportPage());
        // }),
      ],
    );
  }

  Widget _buildFacultyCoordinatorMenu(BuildContext context,
      {Function(String)? onSelect}) {
    return Container(
      color: AppColor.whiteColor,
      child: Wrap(
        alignment: WrapAlignment.start,
        direction: (Device.screenType == ScreenType.desktop ||
                Device.screenType == ScreenType.tablet)
            ? Axis.horizontal
            : Axis.vertical,
        children: [
          _menuItem('Home', onTap: () {
            if (onSelect != null) {
              onSelect("Home");
            }
            _navigateTo(
              context,
              FacultyCoordinatorHomepage(),
            );
          }),
          _menuItem('Publication', onTap: () {
            if (onSelect != null) {
              onSelect("Publication");
            }
            _navigateTo(context, PublishionPage());
          }),
          // _menuItem('Reports', onTap: () {
          //   if (onSelect != null) {
          //     onSelect("Reports");
          //   }
          //   _navigateTo(context, ReportPage());
          // }),
        ],
      ),
    );
  }

  Widget _buildStudentMenu(BuildContext context, {Function(String)? onSelect}) {
    return Container(
      color: AppColor.whiteColor,
      child: Wrap(
        alignment: WrapAlignment.start,
        direction: (Device.screenType == ScreenType.desktop ||
                Device.screenType == ScreenType.tablet)
            ? Axis.horizontal
            : Axis.vertical,
        children: [
          _menuItem('Home', onTap: () {
            if (onSelect != null) {
              onSelect("home");
            }
            _navigateTo(context, StudentHomePage());
          }),
          _menuItem('Submit Article', onTap: () {
            if (onSelect != null) {
              onSelect("Submit Article");
            }
            _navigateTo(context, SubmitPage());
          }),
          _menuItem('My Submissions', onTap: () {
            if (onSelect != null) {
              onSelect("My Submissions");
            }
            _navigateTo(context, MySubmissionsPage());
          }),
        ],
      ),
    );
  }

  Widget _menuItem(String title, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: HeaderSectionTitle(title: title, onTap: onTap),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
