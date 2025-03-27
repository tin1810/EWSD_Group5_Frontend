import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_graphic.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';
import 'package:university_magazine_project/presentation/admin/view/widget/table_item.dart';
import 'package:university_magazine_project/presentation/admin/view/widget/table_title_row.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AdminController adminController = Get.find<AdminController>();
    return Column(
      children: [
        Image.asset(AppGraphic.logoImage, height: 100),
        SizedBox(
          height: 40,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("User Dashboard",
                    style: AppTextStyle.h1iterBold
                        .copyWith(color: AppColor.primaryColor)),
                MaterialButton(
                  padding: EdgeInsets.all(18),
                  color: Colors.amber,
                  elevation: 0.6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    adminController.showCreateUserDialog(context);
                  },
                  child: Row(
                    children: [
                      Text(
                        'Create User',
                        style: AppTextStyle.h5iterRegular,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        FontAwesomeIcons.add,
                        size: 15,
                        color: AppColor.blackColor.withOpacity(0.8),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          // height: 400,
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.greyLightColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                child: TitleTableRow(),
              ),
              Divider(),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: TableItem(
                                  name: adminController.users[index].name,
                                  title: adminController.users[index].email)),
                          Expanded(
                              child: TableItem(
                                  name: adminController.users[index].role,
                                  title: adminController.users[index].faculty)),
                          Expanded(child: SizedBox()),
                          Flexible(
                              flex: 1,
                              child: Container(
                                width: 80,
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
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
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(FontAwesomeIcons.edit),
                                    iconSize: 20,
                                    color: Colors.purple,
                                    onPressed: () {},
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
                                    onPressed: () {},
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
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: adminController.users.length)
            ],
          ),
        ),
      ],
    );
  }
}
