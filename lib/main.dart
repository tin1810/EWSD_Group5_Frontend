import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_bindings.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/faculty_coordinator_homepage.dart';
import 'package:university_magazine_project/presentation/guest_side/view/faulty/faulty_page.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/home_page.dart';
import 'package:university_magazine_project/presentation/manager_side/view/home/manager_homepage.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/home/student_home_page.dart';
import 'package:university_magazine_project/presentation/student_portal_side/view/home/widgets/student_home_information_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'University Magazine',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ManagerHomepage(),
    );
  }
}
