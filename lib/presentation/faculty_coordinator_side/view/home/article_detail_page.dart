import 'dart:io';
import 'package:flutter/material.dart';
import 'package:university_magazine_project/app/config/app_color.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';
import 'package:university_magazine_project/presentation/guest_side/view/home/widget/footer_section.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({super.key});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  File? wordFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ArticleBannerWidget(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width / 10),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  NameAndDateWidget(),
                  const SizedBox(height: 20),
                  Divider(),
                  const SizedBox(height: 20),
                  Text(
                    'Mental health issues among students have gained significant attention in recent years. In this article, we highlight the importance of mental health awareness initiatives on campuses, discussing various programs and services that universities have implemented to support students in need.Mental health issues among students have gained significant attention in recent years. In this article, we highlight the importance of mental health awareness initiatives on campuses, discussing various programs and services that universities have implemented to support students in needMental health issues among students have gained significant attention in recent years. In this article, we highlight the importance of mental health awareness initiatives on campuses, discussing various programs and services that universities have implemented to support students in needMental health issues among students have gained significant attention in recent years. In this article, we highlight the importance of mental health awareness initiatives on campuses, discussing various programs and services that universities have implemented to support students in needMental health issues among students have gained significant attention in recent years. In this article, we highlight the importance of mental health awareness initiatives on campuses, discussing various programs and services that universities have implemented to support students in needMental health issues among students have gained significant attention in recent years. In this article, we highlight the importance of mental health awareness initiatives on campuses, discussing various programs and services that universities have implemented to support students in need',
                    style: AppTextStyle.h5iterRegular
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 40),
                  Divider(),
                  SizedBox(height: 40),
                  CommentBoxWidget(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class NameAndDateWidget extends StatelessWidget {
  const NameAndDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
        const Spacer(),
        Text(
          'March 6, 2025',
          style: AppTextStyle.h5iterRegular.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}

class CommentBoxWidget extends StatelessWidget {
  const CommentBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        width: MediaQuery.sizeOf(context).width / 3,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 0),
                blurStyle: BlurStyle.outer,
                blurRadius: 2,
                spreadRadius: 2)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Comment your opinion upon this article to help student.',
                textAlign: TextAlign.center,
                style: AppTextStyle.h5iterBold.copyWith(color: Colors.black)),
            SizedBox(height: 20),
            TextField(
              controller: TextEditingController(),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                color: AppColor.blueColor,
                onPressed: () {},
                child: Text(
                  "Send",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleBannerWidget extends StatelessWidget {
  const ArticleBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
          fit: BoxFit.cover,
          width: MediaQuery.sizeOf(context).width,
          height: 400,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width / 20,
              bottom: MediaQuery.sizeOf(context).width / 20,
              top: 300),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.black.withOpacity(0.4),
            ),
            child: Text(
              'The Future of Sustainable Energy',
              style: AppTextStyle.h2iterRegular.copyWith(color: Colors.white),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                  color: AppColor.blueColor,
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Center(
                child: Text(
                  "Back",
                  style:
                      AppTextStyle.h2iterRegular.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
