import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_magazine_project/app/model/user_model.dart';
import 'package:university_magazine_project/presentation/admin/controller/admin_controller.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminController controller = Get.find<AdminController>();

    return Expanded(
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                controller.addUser(
                    User(name: "John Doe", role: "Faculty Coordinator"));
              },
              child: Text("Add User"),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.users.length,
                  itemBuilder: (context, index) {
                    final user = controller.users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.role),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => controller.deleteUser(index),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
