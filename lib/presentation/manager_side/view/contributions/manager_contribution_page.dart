import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/banner_imagewith_text.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';
import 'package:university_magazine_project/presentation/manager_side/view/contributions/widget/contribution_list_section.dart';

class ManagerContributionPage extends StatefulWidget  {
  const ManagerContributionPage({super.key});

  @override
  State<ManagerContributionPage> createState() => _ManagerContributionPageState();
}

class _ManagerContributionPageState extends State<ManagerContributionPage>with UserDao {
  UserVO? loggedInUser;
  @override
  void initState() {
    try {
      loggedInUser = getAllUsers()?.firstWhere((e) => e?.isLoggedIn ?? false);
    } catch (e) {
      print(e.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: HoverAppBar(portal: "Manager",userVO: loggedInUser,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeadBannerSection(
                portal: "Manager",
              ),
              BannerImageWithTextWidget(
                imagePath: AppGraphic.managerBG,
                title: "Contributions Overview",
                isManager: true,
              ),
              ContributionListSection(),
              FooterSection(),
            ],
          ),
        ));
  }
}
