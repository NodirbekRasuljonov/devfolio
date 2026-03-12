import 'dart:ui';

import 'package:devfolio/const/colors_const.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.kMainColor,
      body: Stack(
        children: [
          Positioned(
            top: 70.0,
            left: 40.0,

            child: CircleAvatar(
              radius: 250.0,
              backgroundColor: ColorsConst.kCircleColor,
            ),
          ),
          Positioned(
            top: 70,
            right: 40.0,
            child: CircleAvatar(
              radius: 200.0,
              backgroundColor: ColorsConst.kCircleColor,
            ),
          ),
          Positioned(
            top: 250.0,
            right: 20.0,
            left: 20.0,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Hi, I am ",
                    style: TextStyle(
                      color: ColorsConst.kWhiteColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "Nodirbek",
                    style: TextStyle(
                      color: ColorsConst.kWhiteColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 120.0,
            left: 20.0,
            right: 20.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(330, 60),
                backgroundColor: ColorsConst.kCircleColor.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Welecome to DevFolio",
                style: TextStyle(
                  color: ColorsConst.kWhiteColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
