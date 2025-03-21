// import 'package:flutter/material.dart';
// import 'package:university_magazine_project/app/config/app_color.dart';
// import 'package:university_magazine_project/app/config/app_textstyle.dart';
// import 'package:university_magazine_project/presentation/guest_side/view/home/widget/header_section_title.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final String? name1;
//   final String? name2;
//   final Function? onTap;
//   const CustomAppBar({
//     super.key,
//     required this.title,
//     this.name1,
//     this.name2,
//     this.onTap,
//   });
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: AppColor.primaryColor,
//       leadingWidth: double.minPositive,
//       leading: Text(
//         title ?? "",
//         style: AppTextStyle.h2poppinsBold.copyWith(color: AppColor.whiteColor),
//       ),
//       title: Row(
//         children: [
//           HeaderSectionTitle(
//             title: name1 ?? "",
//             onTap: () {
//               onTap!();
//             },
//             isFaulty: true,
//           )
//         ],
//       ),
//     );
//   }
// }
