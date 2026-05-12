import 'package:devfolio/const/colors_const.dart' show ColorsConst;
import 'package:flutter/material.dart';

Scaffold ResumePage() {
  return Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: false,
      actionsPadding: EdgeInsets.only(right: 16.0),

      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "RES",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
              ),
            ), 
            TextSpan(
              text: "UME",
              style: TextStyle(
                color: ColorsConst.kCircleColor.withOpacity(0.9),
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      actions: [
        CircleAvatar(
          radius: 25.0,
          backgroundColor: ColorsConst.kCircleColor,

          child: Icon(
            Icons.file_download_outlined,
            color: Colors.white,
            size: 28.0,
          ),
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsGeometry.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Work History",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Experience",
                  style: TextStyle(
                    color: ColorsConst.kWhiteColor.withOpacity(0.9),
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            exp(
              title: "Flutter Developer",
              comp: "MyGo",
              duration: "2022 - 2023",
              desc:
                  "Worked on developing and maintaining web applications using Flutter and Dart. Collaborated with cross-functional teams to deliver high-quality software solutions.",
            ),
            SizedBox(height: 20.0),
            exp(
              title: "Intern Flutter Developer",
              comp: "Hilol Nashr",
              duration: "2022 - 2022",
              desc:
                  "Designed and implemented user interfaces for web applications using React and JavaScript. Optimized application performance and ensured cross-browser compatibility.",
            ),
            SizedBox(height: 20.0),
            Text(
              "Education",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20.0),
            edu(
              title: "Bachelor of Science in Computer Science",
              uni: "Vistula Group of Universities",
              duration: "2025 - 2028",
            )
          ],
        ),
      ),
    ),
  );
}

Container edu({
  required String title,
  required String uni,
  required String duration,
}) {
  return Container(
    height: 150.0,
    width: double.infinity,
    decoration: BoxDecoration(
      color: ColorsConst.kCircleColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20.0),
    ),
    padding: EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          duration,
          style: TextStyle(
            color: ColorsConst.kCircleColor.withOpacity(0.9),
            fontSize: 16.0,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          uni,
          style: TextStyle(
            color: ColorsConst.kWhiteColor.withOpacity(0.9),
            fontSize: 16.0,
          ),
        ),
      ],
    ),
  );
}

Container exp({
  required String title,
  required String comp,
  required String duration,
  required String desc,
}) {
  return Container(
    height: 300.0,
    width: double.infinity,
    decoration: BoxDecoration(
      color: ColorsConst.kCircleColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20.0),
    ),
    padding: EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          duration,
          style: TextStyle(
            color: ColorsConst.kCircleColor.withOpacity(0.9),
            fontSize: 16.0,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          comp,
          style: TextStyle(
            color: ColorsConst.kWhiteColor.withOpacity(0.9),
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          desc,
          style: TextStyle(
            color: ColorsConst.kWhiteColor.withOpacity(0.9),
            fontSize: 16.0,
          ),
        ),
      ],
    ),
  );
}
