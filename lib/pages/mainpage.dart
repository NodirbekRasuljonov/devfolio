import 'package:devfolio/const/colors_const.dart' show ColorsConst;
import 'package:flutter/material.dart';

Scaffold MainPage(){
  return Scaffold(
    appBar: AppBar(
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "DEV",
                  style: TextStyle(
                    color: ColorsConst.kWhiteColor,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: "FOLIO",
                  style: TextStyle(
                    color: ColorsConst.kCircleColor.withOpacity(0.9),
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: false,
          backgroundColor: ColorsConst.kMainColor,
        ),
  );
}