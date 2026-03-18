import 'package:devfolio/const/colors_const.dart';
import 'package:flutter/material.dart';

Scaffold ContactPage() {
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
              text: "CON",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(
              text: "TACT",
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

          child: Icon(Icons.share_outlined, color: Colors.white, size: 28.0),
        ),
      ],
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            
            shape: RoundedRectangleBorder(
              
              borderRadius: BorderRadius.circular(16),
            ),
            color: ColorsConst.kCircleColor.withOpacity(0.1),
            child: ListTile(
              titleTextStyle: TextStyle(color: ColorsConst.kWhiteColor,),
              subtitleTextStyle: TextStyle(color: ColorsConst.kWhiteColor),
              
              leading: CircleAvatar(child: Icon(Icons.email)),
              title: Text('EMAIL ME'),
              subtitle: Text('hello@techflow.dev'),
              trailing: Icon(Icons.arrow_outward),
            ),
          ),
        ],
      ),
    ),
  );
}
