import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/article_dao.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/admin/view/widget/table_item.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/banner_imagewith_text.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/submission_list_widget.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';

class FacultyCoordinatorHomepage extends StatefulWidget {
  const FacultyCoordinatorHomepage({super.key});

  @override
  State<FacultyCoordinatorHomepage> createState() =>
      _FacultyCoordinatorHomepageState();
}

class _FacultyCoordinatorHomepageState extends State<FacultyCoordinatorHomepage>
    with ArticleDao, UserDao {
  late int commentPercent, missPercent;
  late double progressPercent;
  List<UserVO?>? guestList;
  UserVO? loggedInUser;
  @override
  void initState() {
    try {
      loggedInUser = getAllUsers()?.firstWhere((e) => e?.isLoggedIn ?? false);
      guestList = getAllUsers()
          ?.where((e) =>
              e?.facultyId == loggedInUser?.facultyId && e?.role == "Guest")
          .toList();
    } catch (e) {
      print(e.toString());
    }
    super.initState();
    var commentedList = getAllArticles()
        ?.where((e) =>
            e?.comment != null && e?.facultyId == loggedInUser?.facultyId)
        .toList();
    var unCommentedList = getAllArticles()
        ?.where((e) =>
            e?.comment == null && e?.facultyId == loggedInUser?.facultyId)
        .toList();
    var length1 = commentedList?.length ?? 0;
    var length2 = unCommentedList?.length ?? 0;
    var total = length1 + length2;
    if (total != 0) {
      commentPercent = ((length1 / total) * 100).round();
    } else {
      commentPercent = 0;
    }

    missPercent = 100 - commentPercent;
    progressPercent = missPercent / 100;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: HoverAppBar(
          portal: "Coordinator",
          userVO: loggedInUser,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeadBannerSection(
                portal: "Coordinator",
              ),
              BannerImageWithTextWidget(
                imagePath: AppGraphic.csFaculty,
                title: "Welcome to Computer Science Faculty",
                isManager: false,
              ),
              SubmissionListWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Faculty Report",
                    style: AppTextStyle.h2poppinsBold
                        .copyWith(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CoordinatorReport(
                  progressPercent: progressPercent,
                  commentPercent: commentPercent),
              SizedBox(height: 40),
              Text(
                "Guest Accounts",
                style: AppTextStyle.h2poppinsBold
                    .copyWith(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 20),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        bool isMobile = Device.screenType == ScreenType.mobile;

                        return (isMobile)
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TableItem(
                                            name: guestList?[index]?.name,
                                            title: guestList?[index]?.email),
                                        TableItem(
                                            name: (guestList?[index]?.role ==
                                                    "Student")
                                                ? "Student"
                                                : (guestList?[index]?.role ==
                                                        "Admin")
                                                    ? "Admin"
                                                    : (guestList?[index]
                                                                ?.role ==
                                                            "Coordinator")
                                                        ? "Faculty Coordinator"
                                                        : (guestList?[index]
                                                                    ?.role ==
                                                                "Manager")
                                                            ? "Marketing Manager"
                                                            : "Guest",
                                            title:
                                                guestList?[index]?.facultyId),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.block),
                                          iconSize: 20,
                                          color: Colors.purple,
                                          onPressed: () {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Only Admin can manage this Feature!");
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.deleteLeft,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Only Admin can manage this Feature!");
                                          },
                                        ),
                                        Spacer(),
                                        Container(
                                          width: 80,
                                          height: 24,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.green.shade300),
                                          child: Center(
                                              child: Text(
                                            "Active",
                                            style: AppTextStyle.h6iterRegular,
                                          )),
                                        ),
                                      ],
                                    ),
                                    Divider(), // Adds a visual separation for mobile items
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: TableItem(
                                            name: guestList?[index]?.name,
                                            title: guestList?[index]?.email)),
                                    Expanded(
                                        child: TableItem(
                                            name: (guestList?[index]?.role ==
                                                    "Student")
                                                ? "Student"
                                                : (guestList?[index]?.role ==
                                                        "Admin")
                                                    ? "Admin"
                                                    : (guestList?[index]
                                                                ?.role ==
                                                            "Coordinator")
                                                        ? "Faculty Coordinator"
                                                        : (guestList?[index]
                                                                    ?.role ==
                                                                "Manager")
                                                            ? "Marketing Manager"
                                                            : "Guest",
                                            title:
                                                guestList?[index]?.facultyId)),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: 80,
                                          height: 24,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.green.shade300),
                                          child: Center(
                                              child: Text(
                                            "Active",
                                            style: AppTextStyle.h6iterRegular,
                                          )),
                                        )),
                                    Expanded(child: SizedBox()),
                                    Flexible(
                                        flex: 1,
                                        child: Wrap(
                                          alignment: WrapAlignment.start,
                                          runSpacing: 10,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.block),
                                              iconSize: 20,
                                              color: Colors.purple,
                                              onPressed: () {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Only Admin can manage this Feature!");
                                              },
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                FontAwesomeIcons.deleteLeft,
                                                size: 20,
                                                color: Colors.red,
                                              ),
                                              onPressed: () {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Only Admin can manage this Feature!");
                                              },
                                            ),
                                          ],
                                        )),
                                    // Expanded(
                                    //   child: Text("Action"),
                                    // ),
                                  ],
                                ),
                              );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: guestList?.length ?? 0),
              SizedBox(height: 20),
              FooterSection(),
            ],
          ),
        ));
  }
}

class CoordinatorReport extends StatelessWidget {
  const CoordinatorReport({
    super.key,
    required this.progressPercent,
    required this.commentPercent,
  });

  final double progressPercent;
  final int commentPercent;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      runSpacing: 20,
      spacing: 30,
      children: [
        CircularPercentIndicator(
          radius: 100,
          lineWidth: 30,
          percent: progressPercent,
          progressColor: Colors.redAccent,
          backgroundColor: Colors.greenAccent,
          circularStrokeCap: CircularStrokeCap.butt,
          center: Text(
            "$commentPercent%",
          ),
        ),
        SizedBox(
          width: 340,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 8,
                    color: Colors.green,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Commented (within 14 days)",
                    style: AppTextStyle.h5poppinsRegular.copyWith(fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 8,
                    color: Colors.red,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Without comments (within 14 days)",
                    style: AppTextStyle.h5poppinsRegular.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
