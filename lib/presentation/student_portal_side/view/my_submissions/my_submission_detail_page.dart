import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class MySubmissionDetailPage extends StatefulWidget {
  const MySubmissionDetailPage({super.key});

  @override
  State<MySubmissionDetailPage> createState() => _MySubmissionDetailPageState();
}

class _MySubmissionDetailPageState extends State<MySubmissionDetailPage> {
  File? wordFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
                  fit: BoxFit.cover,
                  width: MediaQuery.sizeOf(context).width,
                  height: 350,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width / 20,
                    bottom: MediaQuery.sizeOf(context).width / 20,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: Text(
                      'The Future of Sustainable Energy',
                      style: AppTextStyle.h2iterRegular
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'March 6, 2025',
              style: AppTextStyle.h5iterRegular.copyWith(color: Colors.grey),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww"),
                  radius: 14,
                ),
                SizedBox(width: 8),
                Text(
                  'Htet Wai Lwin',
                  style: AppTextStyle.h5iterBold.copyWith(color: Colors.black),
                ),
                SizedBox(width: 40),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2,
                  child: Text(
                    'Mental health issues among students have gained significant attention in recent years. In this article, we highlight the importance of mental health awareness initiatives on campuses, discussing various programs and services that universities have implemented to support students in need.',
                    style: AppTextStyle.h5iterRegular
                        .copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 40),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.black54,
                ),
                child: Column(
                  children: [
                    Text('Resubmit Your Article',
                        style: AppTextStyle.h1iterBold
                            .copyWith(color: Colors.white)),
                    SizedBox(height: 20),
                    Text(
                        'We look forward to reviewing your work until final closure date!',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.h5iterBold
                            .copyWith(color: Colors.white)),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(8),
                      key: Key("3"),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              (wordFile != null)
                                  ? (wordFile!.path.split("/")).last
                                  : "Add Article File(WORD)",
                              style: TextStyle(color: Colors.white),
                            ),
                            InkWell(
                              onTap: () async {
                                var result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.any,
                                  allowMultiple: false,
                                );
                                var platFormFile = result?.files.first;
                                if (platFormFile != null) {
                                  setState(() {
                                    wordFile = File(platFormFile.path ?? "");
                                  });
                                }
                              },
                              child: Icon(
                                Icons.article_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      color: AppColor.blueColor,
                      onPressed: () {},
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
