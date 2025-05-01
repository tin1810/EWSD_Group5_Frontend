import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/app/model/article_vo.dart';
import 'package:university_magazine_project/app/model/faculty_vo.dart';
import 'package:university_magazine_project/app/model/user_vo.dart';
import 'package:university_magazine_project/hive/dao/article_dao.dart';
import 'package:university_magazine_project/hive/dao/faculty_dao.dart';
import 'package:university_magazine_project/hive/dao/user_dao.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/banner_imagewith_text.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';
import 'package:university_magazine_project/presentation/manager_side/view/home/widget/key_reports_section.dart';
import 'package:university_magazine_project/presentation/manager_side/view/home/widget/recent_contribution_section.dart';

// List<DateDetailVO> dateDetails = [
//   DateDetailVO(
//     percentValue: 85,
//     faculty: 'Engineering',
//     totalContributions: "34",
//     totalContributors: "22",
//   ),
//   DateDetailVO(
//     percentValue: 78,
//     faculty: 'Business',
//     totalContributions: "34",
//     totalContributors: "22",
//   ),
//   DateDetailVO(
//     percentValue: 92,
//     faculty: 'Arts & Humanities',
//     totalContributions: "34",
//     totalContributors: "22",
//   ),
//   DateDetailVO(
//     percentValue: 65,
//     faculty: 'Science',
//     totalContributions: "34",
//     totalContributors: "22",
//   ),
//   DateDetailVO(
//     percentValue: 74,
//     faculty: 'Education',
//     totalContributions: "34",
//     totalContributors: "22",
//   ),
//   DateDetailVO(
//     percentValue: 88,
//     faculty: 'Law',
//     totalContributions: "34",
//     totalContributors: "22",
//   ),
//   DateDetailVO(
//     percentValue: 81,
//     faculty: 'Medicine',
//     totalContributions: "34",
//     totalContributors: "22",
//   ),
//   DateDetailVO(
//     percentValue: 81,
//     faculty: 'Social',
//     totalContributions: "34",
//     totalContributors: "22",
//   ),
//   DateDetailVO(
//     percentValue: 81,
//     faculty: 'Psycho',
//     totalContributions: "34",
//     totalContributors: "22",
//   ),
// ];

class ManagerHomepage extends StatefulWidget {
  const ManagerHomepage({super.key});

  @override
  State<ManagerHomepage> createState() => _ManagerHomepageState();
}

class _ManagerHomepageState extends State<ManagerHomepage>
    with ArticleDao, FacultyDao, UserDao {
  List<ArticleVO?>? publishedList;
  List<FacultyVO?>? facultyList;
  List<DateDetailVO>? dateList;
  UserVO? loginUser;
  @override
  void initState() {
    loginUser = getAllUsers()?.firstWhere((e) => e?.isLoggedIn == true);
    publishedList =
        getAllArticles()?.where((e) => e?.isPublished == true).toList();
    facultyList = getAllFaculty();
    dateList = List.generate(facultyList?.length ?? 0, (index) {
      var studentsInFac = getAllUsers()
              ?.where((e) => e?.facultyId == facultyList?[index]?.id)
              .toList() ??
          [];
      var publishedListByFacId = publishedList
              ?.where((e) => e?.facultyId == facultyList?[index]?.id)
              .toList() ??
          [];
      var contributorStudents = publishedListByFacId.map((e) {
        return e?.studentId ?? "";
      }).toList();
      contributorStudents = contributorStudents.toSet().toList();
      int cl = contributorStudents.length;
      int stfac = studentsInFac.length;
      int percent = 0;
      if (stfac != 0) {
        percent = ((cl / stfac) * 100).round();
      }
      return DateDetailVO(
        percentValue: percent,
        faculty: facultyList?[index]?.name ?? "",
        totalContributions: "${publishedListByFacId.length}",
        totalContributors: contributorStudents.length.toString(),
      );
    });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: HoverAppBar(
          portal: "Manager",
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeadBannerSection(
                portal: "Manager",
              ),
              BannerImageWithTextWidget(
                imagePath: AppGraphic.managerBG,
                title: "Welcome to the University Marketing Manager Portal",
                isManager: true,
              ),
              RecentContributionSection(),
              KeyReportsSection(
                builder: BarChartSectionView(dateList: dateList ?? []),
              ),
              FooterSection(),
            ],
          ),
        ));
  }
}

class BarChartSectionView extends StatefulWidget {
  final List<DateDetailVO> dateList;
  const BarChartSectionView({
    super.key,
    required this.dateList,
  });

  @override
  State<BarChartSectionView> createState() => _BarChartSectionViewState();
}

class _BarChartSectionViewState extends State<BarChartSectionView> {
  late List<ChartDataVO> chartDataList;
  List<ChartDataVO> _getChartList() {
    var list = widget.dateList.map((e) {
      return ChartDataVO(
        "${e.faculty ?? " "}\nTC-${e.totalContributions}\nTSC-${e.totalContributors}",
        e.percentValue ?? 0,
        Colors.green,
      );
    }).toList();
    return list;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      chartDataList = _getChartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 2,
      width: 1500,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            title: AxisTitle(
              text: "Percentage of contributions by faculty",
            ),
          ),
          series: [
            StackedColumnSeries(
              dataSource: chartDataList,
              xValueMapper: (chart, _) => chart.x,
              yValueMapper: (chart, _) => chart.y1,
              pointColorMapper: (chart, _) => chart.color,
            ),
          ],
        ),
      ),
    );
  }
}

class ChartDataVO {
  String x;
  int y1;
  Color color;

  ChartDataVO(
    this.x,
    this.y1,
    this.color,
  );
}

class DateDetailVO {
  int? percentValue;
  String? faculty, totalContributions, totalContributors;

  DateDetailVO({
    this.percentValue,
    this.faculty,
    this.totalContributions,
    this.totalContributors,
  });
}
