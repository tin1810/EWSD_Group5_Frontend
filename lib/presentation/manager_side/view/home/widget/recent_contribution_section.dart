import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class RecentContributionSection extends StatefulWidget {
  const RecentContributionSection({super.key});

  @override
  _RecentContributionSectionState createState() =>
      _RecentContributionSectionState();
}

class _RecentContributionSectionState extends State<RecentContributionSection> {
  final List<bool> _isHovered = List.filled(3, false);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 50),
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Recent Contributions from Our Faculties",
            style: AppTextStyle.h1iterRegular
                .copyWith(color: AppColor.blackColor, fontSize: 30),
          ),
          const SizedBox(height: 8),
          Text(
            "Stay updated with the latest articles and contributions made by students and faculty members across the university.",
            style:
                AppTextStyle.h5iterRegular.copyWith(color: AppColor.blackColor),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return MouseRegion(
                  onEnter: (_) => setState(() => _isHovered[index] = true),
                  onExit: (_) => setState(() => _isHovered[index] = false),
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      debugPrint('Contribution $index clicked');
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: _isHovered[index]
                          ? (Matrix4.identity()..scale(1.05))
                          : Matrix4.identity(),
                      width: MediaQuery.sizeOf(context).width / 4,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        boxShadow: _isHovered[index]
                            ? [
                                BoxShadow(
                                  color: AppColor.greyLightColor,
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                )
                              ]
                            : [],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://images.unsplash.com/photo-1523240795612-9a054b0db644?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'The Future of Sustainable Energy',
                            style: AppTextStyle.h2iterBold
                                .copyWith(color: AppColor.blackColor),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'March 6, 2025',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.h3iterRegular
                                .copyWith(color: AppColor.blackColor),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: Text(
                              "In this latest contribution, researchers from the Faculty of Environmental Studies explore the future of sustainable energy and the role of universities in promoting sustainable practices.",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.h5iterRegular
                                  .copyWith(color: AppColor.blackColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
