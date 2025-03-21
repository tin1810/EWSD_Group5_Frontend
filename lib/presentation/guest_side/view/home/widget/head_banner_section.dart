import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/faculty_coordinator_homepage.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/publishion/publishion_page.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/report/report_page.dart';
import 'package:university_magazine_project/presentation/guest_side/view/faulty/faulty_page.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/header_section_title.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/home/student_home_page.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/my_submissions/my_submissions_page.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/submit/submit_page.dart';

class HeadBannerSection extends StatelessWidget {
  final String? portal;
  const HeadBannerSection({super.key, this.portal});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 100,
          child: Image.asset(AppGraphic.logoImage, fit: BoxFit.cover),
        ),
        if (portal == null) _buildGuestMenu(context),
        if (portal == "Student") _buildStudentMenu(context),
        if (portal == "CS") _buildFacultyCoordinatorMenu(context),
      ],
    );
  }

  Widget _buildGuestMenu(BuildContext context) {
    return Row(
      children: [
        _menuItem('Home'),
        _menuItem('Article'),
        _menuItem('Faculty', onTap: () => _navigateTo(context, FacultyPage())),
        _menuItem('About Us'),
      ],
    );
  }

  Widget _buildFacultyCoordinatorMenu(BuildContext context,
      {Function(String)? onSelect}) {
    return Row(
      children: [
        _menuItem(
          'Home',
          onTap: () => _navigateTo(
            context,
            FacultyCoordinatorHomepage(),
          ),
        ),
        _menuItem('Publishion',
            onTap: () => _navigateTo(context, PublishionPage())),
        _menuItem('Reports', onTap: () => _navigateTo(context, ReportPage())),
      ],
    );
  }

  Widget _buildStudentMenu(BuildContext context, {Function(String)? onSelect}) {
    return Row(
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
