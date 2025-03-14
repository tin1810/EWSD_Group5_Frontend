import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/header_section_title.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/home/student_home_page.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/my_submissions/my_submissions_page.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/submit/submit_page.dart';

class HeadBannerSection extends StatelessWidget {
  final String? portal;
  const HeadBannerSection({
    super.key,
    this.portal,
  });

  @override
  Widget build(BuildContext context) {
    // final HomeController controller = Get.find<HomeController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 100,
          child: Image.asset(
            AppGraphic.logoImage,
            fit: BoxFit.cover,
          ),
        ),
        if (portal == null)
          Row(
            children: [
              HeaderSectionTitle(
                title: 'Home',
              ),
              SizedBox(width: 20),
              HeaderSectionTitle(
                title: 'Article',
              ),
              SizedBox(width: 20),
              HeaderSectionTitle(
                title: 'Faculty',
              ),
              SizedBox(width: 20),
              HeaderSectionTitle(
                title: 'About Us',
              ),
            ],
          ),
        if (portal == "Student")
          Row(
            children: [
              HeaderSectionTitle(
                title: 'Home',
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return StudentHomePage();
                  }));
                },
              ),
              SizedBox(width: 20),
              HeaderSectionTitle(
                title: 'Submit Article',
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return SubmitPage();
                  }));
                },
              ),
              SizedBox(width: 20),
              HeaderSectionTitle(
                title: 'My Submissions',
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return MySubmissionsPage();
                  }));
                },
              ),
            ],
          ),
      ],
    );
  }
}
