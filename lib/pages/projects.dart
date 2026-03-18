import 'package:devfolio/const/colors_const.dart' show ColorsConst;
import 'package:flutter/material.dart';

Scaffold Projects(){
  return Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: false,

      title: RichText(text: TextSpan(
        children: [
          TextSpan(
            text: "PRO",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: "JECTS",
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
        "Projects Page",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),  
  );
}