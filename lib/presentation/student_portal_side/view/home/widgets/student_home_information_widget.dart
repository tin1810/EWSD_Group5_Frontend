import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:university_magazine_project/app/config/app_textstyle.dart';

class StudentHomeInformationWidget extends StatelessWidget {
  const StudentHomeInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(92, 133, 158, 1),
            Color.fromRGBO(110, 146, 172, 1),
          ],
        ),
      ),
      child: Column(
        children: [
          Text('Explore Our Latest Articles',
              style: AppTextStyle.h1iterBold
                  .copyWith(color: Colors.white, fontSize: 28)),
          SizedBox(height: 20),
          Text(
              'Dive into a collection of insightful articles crafted by our talented contributors. Stay updated on diverse topics and immerse yourself in new ideas.',
              textAlign: TextAlign.center,
              style: AppTextStyle.h5iterBold
                  .copyWith(color: Colors.white, fontSize: 22)),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: (MediaQuery.sizeOf(context).width / 4),
                child: Column(
                  children: [
                    Image.network(
                      "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
                    ),
                    SizedBox(height: 10),
                    Text('The Future of Sustainable Energy',
                        style: AppTextStyle.h2iterBold
                            .copyWith(color: Colors.white)),
                    SizedBox(height: 10),
                    Text('March 6, 2025',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.h4iterBold
                            .copyWith(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(
                width: (MediaQuery.sizeOf(context).width / 4),
                child: Column(
                  children: [
                    Image.network(
                      "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
                    ),
                    SizedBox(height: 10),
                    Text('Cultural Heritage in Modern Society',
                        style: AppTextStyle.h2iterBold
                            .copyWith(color: Colors.white)),
                    SizedBox(height: 10),
                    Text('March 6, 2025',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.h4iterBold
                            .copyWith(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(
                width: (MediaQuery.sizeOf(context).width / 4),
                child: Column(
                  children: [
                    Image.network(
                      "https://media.istockphoto.com/id/107429764/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/woman-taking-vitamins-and-supplements.jpg?s=1024x1024&w=is&k=20&c=-IVuRL-VTpW5gtoXt9FFG-q3Sg8p_1KdJf8JXs6Hg0E=",
                    ),
                    SizedBox(height: 10),
                    Text('The Rise of Artificial Intelligence',
                        style: AppTextStyle.h2iterBold
                            .copyWith(color: Colors.white)),
                    SizedBox(height: 10),
                    Text('March 6, 2025',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.h4iterBold
                            .copyWith(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          Text('Submission Guidelines',
              style: AppTextStyle.h1iterBold
                  .copyWith(color: Colors.white, fontSize: 28)),
          SizedBox(height: 20),
          Text(
              'Follow our guidelines to ensure your submissions meet our standards and are considered for publication.',
              textAlign: TextAlign.center,
              style: AppTextStyle.h5iterBold
                  .copyWith(color: Colors.white, fontSize: 22)),
          SizedBox(height: 40),
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            decoration: BoxDecoration(color: Colors.white),
            child: Wrap(
              direction: (Device.screenType == ScreenType.desktop ||
                      Device.screenType == ScreenType.tablet)
                  ? Axis.horizontal
                  : Axis.vertical,
              children: [
                Image.network(
                  width: MediaQuery.sizeOf(context).width / 2.3,
                  fit: BoxFit.fitWidth,
                  "https://plus.unsplash.com/premium_photo-1661255378914-d0934128d91d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YXJ0aWNsZXxlbnwwfHwwfHx8MA%3D%3D",
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 30,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2.3,
                  child: Column(
                    children: [
                      Text('Article Submission Requirements',
                          style: AppTextStyle.h1iterBold),
                      SizedBox(height: 20),
                      Text(
                          'To submit an article, please ensure it is a Word document formatted according to our guidelines. Articles should be original, well-researched, and between 800 to 1500 words in length. Include citations where applicable, and remember to check for grammar and spelling errors before submission.',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h5iterBold),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            decoration: BoxDecoration(color: Colors.white),
            child: Wrap(
              direction: (Device.screenType == ScreenType.desktop ||
                      Device.screenType == ScreenType.tablet)
                  ? Axis.horizontal
                  : Axis.vertical,
              children: [
                Image.network(
                  width: MediaQuery.sizeOf(context).width / 2.3,
                  fit: BoxFit.fitWidth,
                  "https://images.unsplash.com/photo-1488372759477-a7f4aa078cb6?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 30,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2.3,
                  child: Column(
                    children: [
                      Text('Image Submission Guidelines',
                          style: AppTextStyle.h1iterBold),
                      SizedBox(height: 20),
                      Text(
                          'High-quality images are essential for enhancing your articles. Please submit images in JPEG or PNG format. Ensure images are at least 300 DPI and relevant to the content of your article. Include captions and credits for all images submitted.',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h5iterBold),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            decoration: BoxDecoration(color: Colors.white),
            child: Wrap(
              direction: (Device.screenType == ScreenType.desktop ||
                      Device.screenType == ScreenType.tablet)
                  ? Axis.horizontal
                  : Axis.vertical,
              children: [
                Image.network(
                  width: MediaQuery.sizeOf(context).width / 2.3,
                  fit: BoxFit.fitWidth,
                  "https://images.unsplash.com/photo-1457369804613-52c61a468e7d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXJ0aWNsZXxlbnwwfHwwfHx8MA%3D%3D",
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 30,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2.3,
                  child: Column(
                    children: [
                      Text('Updating Your Submissions',
                          style: AppTextStyle.h1iterBold),
                      SizedBox(height: 20),
                      Text(
                          'You can update your submissions until the final closure date. If you wish to make changes to an already submitted article or image, please follow the designated procedure outlined in our submission portal. We encourage you to refine your work to ensure it meets our publication standards.',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h5iterBold),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
