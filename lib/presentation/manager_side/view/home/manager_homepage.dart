import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/presentation/faculty_coordinator_side/view/home/widget/banner_imagewith_text.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/head_banner_section.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/hover_appbar.dart';
import 'package:university_magazine_project/presentation/manager_side/view/home/widget/key_reports_section.dart';
import 'package:university_magazine_project/presentation/manager_side/view/home/widget/recent_contribution_section.dart';

List<DateDetailVO> dateDetails = [
  DateDetailVO(
    percentValue: 85,
    faculty: 'Engineering',
    totalContributions: "34",
    totalContributors: "22",
  ),
  DateDetailVO(
    percentValue: 78,
    faculty: 'Business',
    totalContributions: "34",
    totalContributors: "22",
  ),
  DateDetailVO(
    percentValue: 92,
    faculty: 'Arts & Humanities',
    totalContributions: "34",
    totalContributors: "22",
  ),
  DateDetailVO(
    percentValue: 65,
    faculty: 'Science',
    totalContributions: "34",
    totalContributors: "22",
  ),
  DateDetailVO(
    percentValue: 74,
    faculty: 'Education',
    totalContributions: "34",
    totalContributors: "22",
  ),
  DateDetailVO(
    percentValue: 88,
    faculty: 'Law',
    totalContributions: "34",
    totalContributors: "22",
  ),
  DateDetailVO(
    percentValue: 81,
    faculty: 'Medicine',
    totalContributions: "34",
    totalContributors: "22",
  ),
  DateDetailVO(
    percentValue: 81,
    faculty: 'Social',
    totalContributions: "34",
    totalContributors: "22",
  ),
  DateDetailVO(
    percentValue: 81,
    faculty: 'Psycho',
    totalContributions: "34",
    totalContributors: "22",
  ),
];

class ManagerHomepage extends StatelessWidget {
  const ManagerHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: HoverAppBar(portal: "Manager"),
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
                builder: BarChartSectionView(dateList: dateDetails),
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
