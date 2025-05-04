import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/model/faculty_vo.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/faculty_dao.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';
import 'package:university_magazine_project/presentation/admin/view/admin_homepage.dart';
import 'package:university_magazine_project/presentation/guest_side/controller/home_controller.dart';
import 'package:university_magazine_project/presentation/guest_side/view/faulty/faulty_page.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/home_page.dart';
import 'package:university_magazine_project/presentation/manager_side/view/home/manager_homepage.dart';
import 'package:university_magazine_project/presentation/portal/view/login/login_page.dart';

import '../../../../../app/config/app_textstyle.dart';

class HoverAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? portal;
  final UserVO? userVO;
  final BuildContext? rContext;

  const HoverAppBar({
    super.key,
    this.portal,
    required this.userVO,
    this.rContext,
  });

  @override
  State<HoverAppBar> createState() => _HoverAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HoverAppBarState extends State<HoverAppBar> with UserDao, FacultyDao {
  //final HomeController controller = Get.find<HomeController>();
  var backgroundColor = AppColor.primaryColor;
  final List<String> imageUrlsForBanners = [
    "https://images.unsplash.com/photo-1568792923760-d70635a89fdc?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/flagged/photo-1554473675-d0904f3cbf38?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1504817343863-5092a923803e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  ];
  void onHover(bool isHovered) {
    backgroundColor =
        isHovered ? AppColor.hoverAppBarColor : AppColor.primaryColor;
    setState(() {});
  }

  List<Map<String, dynamic>> socialIcons = [
    {'icon': FontAwesomeIcons.facebook, 'url': 'https://facebook.com'},
    {'icon': FontAwesomeIcons.snapchat, 'url': 'https://snapchat.com'},
    {'icon': FontAwesomeIcons.instagram, 'url': 'https://instagram.com'},
    {'icon': FontAwesomeIcons.youtube, 'url': 'https://youtube.com'},
    {'icon': FontAwesomeIcons.xTwitter, 'url': 'https://twitter.com'},
    {'icon': FontAwesomeIcons.linkedinIn, 'url': 'https://linkedin.com'},
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.primaryColor,
      centerTitle: false,
      title: (widget.userVO?.name != null)
          ? null
          : MouseRegion(
              onEnter: (_) => onHover(true),
              onExit: (_) => onHover(false),
              child: MaterialButton(
                minWidth: 100,
                height: 80,
                color: backgroundColor,
                child: Text(
                  (widget.portal == null ||
                          widget.portal == "" ||
                          widget.portal == "Portal")
                      ? "Portal"
                      : "Back To Main",
                  style: AppTextStyle.h5poppinsRegular
                      .copyWith(color: AppColor.whiteColor),
                ),
                onPressed: () {
                  try {
                    if (widget.portal == null ||
                        widget.portal == "" ||
                        widget.portal == "Portal") {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => true,
                      );
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (route) => true,
                      );
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
            ),
      actions: (widget.userVO?.name == null)
          ? [
              TextButton(
                onPressed: () {
                  showCreateUserDialog();
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]
          : [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/commenter.jpg"),
                radius: 14,
              ),
              const SizedBox(width: 4),
              Text(
                widget.userVO?.name ?? "",
                style: AppTextStyle.h5poppinsRegular
                    .copyWith(color: AppColor.whiteColor),
              ),
              const SizedBox(width: 20),
              IconButton(
                  onPressed: () {
                    try {
                      widget.userVO?.isLoggedIn = false;
                      saveUser(widget.userVO);
                      Fluttertoast.showToast(msg: "Logout Successfully");
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (route) => true,
                      );
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  )),
              const SizedBox(width: 4),
            ],
    );
  }

  void showCreateUserDialog() {
    FacultyVO? selectedFaculty;
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    List<FacultyVO?> faculties = getAllFaculty() ?? [];
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text("Create User", style: AppTextStyle.h3poppinsBold),
        content: SingleChildScrollView(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: AppTextStyle.h5poppinsRegular,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: AppTextStyle.h5poppinsRegular,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: AppTextStyle.h5poppinsRegular,
                  ),
                ),
                SizedBox(height: 10),

                /// Faculty dropdown
                StatefulBuilder(
                  builder: (context, setState) {
                    return DropdownButtonFormField<FacultyVO>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: "Faculty",
                        labelStyle: AppTextStyle.h5poppinsRegular,
                      ),
                      value: selectedFaculty,
                      items: faculties
                          .map((faculty) => DropdownMenuItem(
                                value: faculty,
                                child: Text(faculty?.name ?? 'Unknown'),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() => selectedFaculty = value);
                      },
                    );
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              if (selectedFaculty != null &&
                  nameController.text != "" &&
                  emailController.text != "" &&
                  passwordController.text != "") {
                var user = UserVO(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  facultyId: selectedFaculty?.id,
                  role: "Guest",
                  status: 'active',
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  isLoggedIn: true,
                );
                saveUser(user);
                var users = getAllUsers();
                final coordinator = users?.firstWhere(
                  (user) =>
                      user?.facultyId == selectedFaculty?.id &&
                      user?.role == "Coordinator",
                  orElse: () => UserVO(
                      id: "", name: "", email: "", facultyId: "", role: ""),
                );
                sendEmail(
                    name: nameController.text,
                    email: emailController.text,
                    subject: "Guest Registration",
                    message: "A new user has registered to your faculty",
                    toEmail: coordinator?.email ?? "");
                Fluttertoast.showToast(msg: "Account Registered Successfully");
                Get.back();
              }
            },
            child: Text("Create"),
          ),
        ],
      ),
    );
  }

  Future<void> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String toEmail,
    required String message,
  }) async {
    final serviceId = 'service_3xn2d1t';
    final templateId = 'template_ulplfj9';
    final userId = 'ppkRQ7mtNoYYnDkHg';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final payload = {
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'user_name': name,
        'user_email': email,
        'to_email': toEmail,
        'user_subject': subject,
        'user_message': message,
      }
    };

    try {
      final response = await http.post(
        url,
        body: jsonEncode(payload),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print("✅ Email sent successfully.");
      } else {
        print("❌ Failed to send email. Status: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      print("❗Error sending email: $e");
    }
  }
}
