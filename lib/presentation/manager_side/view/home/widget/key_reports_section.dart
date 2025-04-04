import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class KeyReportsSection extends StatefulWidget {
  final Widget builder;
  const KeyReportsSection({
    super.key,
    required this.builder,
  });

  @override
  State<KeyReportsSection> createState() => _KeyReportsSectionState();
}

class _KeyReportsSectionState extends State<KeyReportsSection> {
  final List<bool> _isHovered = List.filled(3, false); // Track hover states

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.greyLightColor,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Key Statistical Reports",
            style: AppTextStyle.h1iterRegular
                .copyWith(color: AppColor.blackColor, fontSize: 30),
          ),
          const SizedBox(height: 8),
          Text(
            "Access comprehensive reports that provide valuable insights into the contributions across faculties and student engagement levels.",
            style:
                AppTextStyle.h5iterRegular.copyWith(color: AppColor.blackColor),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "TC",
                      style: AppTextStyle.h5poppinsRegular.copyWith(fontSize: 14),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "-Total Contributions",
                      style: AppTextStyle.h5poppinsRegular.copyWith(fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "TSC",
                      style: AppTextStyle.h5poppinsRegular.copyWith(fontSize: 14),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "-Total Student Contributors",
                      style: AppTextStyle.h5poppinsRegular.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          widget.builder,
          // Expanded(
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 3,
          //     itemBuilder: (context, index) {
          //       return MouseRegion(
          //         onEnter: (_) => setState(() => _isHovered[index] = true),
          //         onExit: (_) => setState(() => _isHovered[index] = false),
          //         cursor: SystemMouseCursors.click, // Changes cursor on hover
          //         child: GestureDetector(
          //           onTap: () {
          //             debugPrint('Report $index clicked'); // Handle click event
          //           },
          //           child: AnimatedContainer(
          //             duration: const Duration(milliseconds: 200),
          //             transform: _isHovered[index]
          //                 ? (Matrix4.identity()..scale(1.05))
          //                 : Matrix4.identity(),
          //             width: MediaQuery.sizeOf(context).width / 4,
          //             margin: const EdgeInsets.symmetric(horizontal: 20),
          //             decoration: BoxDecoration(
          //               boxShadow: _isHovered[index]
          //                   ? [
          //                       BoxShadow(
          //                         color: AppColor.hoverAppBarColor
          //                             .withOpacity(0.1),
          //                         blurRadius: 2,
          //                         spreadRadius: 2,
          //                       )
          //                     ]
          //                   : [],
          //             ),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Image.network(
          //                   "https://images.unsplash.com/photo-1507925921958-8a62f3d1a50d?q=80&w=2952&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          //                 ),
          //                 const SizedBox(height: 10),
          //                 Text(
          //                   'Total Contributions Overview',
          //                   style: AppTextStyle.h2iterBold
          //                       .copyWith(color: AppColor.blackColor),
          //                 ),
          //                 const SizedBox(height: 5),
          //                 Text(
          //                   'April 10, 2025',
          //                   textAlign: TextAlign.center,
          //                   style: AppTextStyle.h3iterRegular
          //                       .copyWith(color: AppColor.blackColor),
          //                 ),
          //                 const SizedBox(height: 5),
          //                 Expanded(
          //                   child: Text(
          //                     "This report summarizes the total number of contributions submitted by each faculty, offering a clear picture of participation levels across the university.",
          //                     maxLines: 3,
          //                     overflow: TextOverflow.ellipsis,
          //                     style: AppTextStyle.h5iterRegular
          //                         .copyWith(color: AppColor.blackColor),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
