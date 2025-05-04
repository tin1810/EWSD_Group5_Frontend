import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart' as rs;
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/admin/view/admin_homepage.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/faculty_coordinator_homepage.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/home_page.dart';
import 'package:university_magazine_project/presentation/manager_side/view/home/manager_homepage.dart';
import 'package:university_magazine_project/presentation/portal/controller/login_controller.dart';
import 'package:university_magazine_project/presentation/portal/view/login/widget/custom_textfield.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/home/student_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with UserDao {
  UserVO? loggedInUser;
  bool load = false;
  @override
  void initState() {
    load = true;
    try {
      loggedInUser = getAllUsers()?.firstWhere((e) => e?.isLoggedIn ?? false);
      if (loggedInUser?.name != null) {
        Fluttertoast.showToast(msg: "Welcome ${loggedInUser?.name}");
        Fluttertoast.showToast(
            msg: "Your last login date is ${loggedInUser?.lastLoggedInDate}",
            toastLength: Toast.LENGTH_LONG);
        var v = loggedInUser?.role;
        if (v == "Student") {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const StudentHomePage()),
            (route) => true,
          );
        }
        if (v == "Admin") {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const AdminHomePage()),
            (route) => true,
          );
        }
        if (v == "Coordinator") {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const FacultyCoordinatorHomepage()),
            (route) => true,
          );
        }
        if (v == "Manager") {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const ManagerHomepage()),
            (route) => true,
          );
        }
        load = false;
        setState(() {});
      }
    } catch (e) {
      load = false;
      setState(() {});
      print(e.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: (load)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              decoration: BoxDecoration(),
              child: Row(
                children: [
                  if (rs.Device.screenType == rs.ScreenType.desktop ||
                      rs.Device.screenType == rs.ScreenType.tablet)
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    AppGraphic.loginBGImage,
                                  ),
                                  fit: BoxFit.cover))),
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              AppGraphic.logoImage,
                              height: 130,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text('Login to your portal!',
                                  overflow: TextOverflow.fade,
                                  maxLines: 2,
                                  style: AppTextStyle.h1iterBold),
                              Icon(
                                FontAwesomeIcons.handPeace,
                                color: Colors.amberAccent,
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            child: Text(
                              "Email",
                              style: AppTextStyle.h4poppinsRegular,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                            child: CustomTextField(
                              focusNode: FocusNode(),
                              onChanged: (value) =>
                                  loginController.email.value = value,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                            child: Text(
                              "Password",
                              style: AppTextStyle.h4poppinsRegular,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            child: CustomTextField(
                              focusNode: FocusNode(),
                              obscureText: true,
                              onChanged: (value) =>
                                  loginController.password.value = value,
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 100),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 50,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                color: AppColor.hoverAppBarColor,
                                onPressed: () {
                                  loginController.onTapLogin().then((v) {
                                    if (v == "Student") {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const StudentHomePage()),
                                        (route) => true,
                                      );
                                    }
                                    if (v == "Admin") {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AdminHomePage()),
                                        (route) => true,
                                      );
                                    }
                                    if (v == "Coordinator") {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const FacultyCoordinatorHomepage()),
                                        (route) => true,
                                      );
                                    }
                                    if (v == "Manager") {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ManagerHomepage()),
                                        (route) => true,
                                      );
                                    }
                                    if (v == "Guest") {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const HomePage()),
                                            (route) => true,
                                      );
                                    }
                                  }).onError((e, st) {
                                    Fluttertoast.showToast(msg: e.toString());
                                  });
                                },
                                child: Text('Sign In',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                              child: Text('OR',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 23))),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (route) => true,
                                );
                              },
                              child: Text("Not Now"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
