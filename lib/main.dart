import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:university_magazine_project/app/config/app_bindings.dart';
import 'package:university_magazine_project/app/model/article_vo.dart';
import 'package:university_magazine_project/app/model/comment_vo.dart';
import 'package:university_magazine_project/app/model/faculty_vo.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/app/populations/articles.dart';
import 'package:university_magazine_project/app/populations/faculty.dart';
import 'package:university_magazine_project/app/populations/user.dart';
import 'package:university_magazine_project/hive/dao/article_dao.dart';
import 'package:university_magazine_project/hive/dao/faculty_dao.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/hive/hive_constants.dart';
import 'package:university_magazine_project/presentation/admin/view/admin_homepage.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/faculty_coordinator_homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserVOAdapter());
  Hive.registerAdapter(ArticleVOAdapter());
  Hive.registerAdapter(CommentVOAdapter());
  Hive.registerAdapter(FacultyVOAdapter());
  await Hive.openBox<UserVO>(BOX_NAME_USER_VO);
  await Hive.openBox<ArticleVO>(BOX_NAME_ARTICLE_VO);
  await Hive.openBox<FacultyVO>(BOX_NAME_FACULTY_VO);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with UserDao, ArticleDao, FacultyDao {
  @override
  void initState() {
    for (UserVO user in populatedUsers) {
      saveUser(user);
    }
    for (FacultyVO fac in faculties) {
      saveFaculty(fac);
    }
    for (ArticleVO art in articles) {
      saveArticle(art);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, ori, st) => GetMaterialApp(
        title: 'University Magazine',
        debugShowCheckedModeBanner: false,
        initialBinding: AppBindings(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AdminHomePage(),
      ),
    );
  }
}
