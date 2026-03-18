import 'package:devfolio/const/colors_const.dart' show ColorsConst;
import 'package:flutter/material.dart';

Scaffold ResumePage(){
  return Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
      title: RichText(text: TextSpan(
        children: [
          TextSpan(
            text: "RESU",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: "ME",
            style: TextStyle(
              color: ColorsConst.kCircleColor.withOpacity(0.9),
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      )),
    ),
    body: Center(
      child: Text(
        "Resume Page",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),  
  );
}