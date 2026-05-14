import 'package:devfolio/const/colors_const.dart' show ColorsConst;
import 'package:devfolio/const/textconst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Scaffold MainPage() {
  TextConst texts = TextConst();
  return Scaffold(
    backgroundColor: Colors.transparent,
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
    body: Padding(
      padding: EdgeInsets.all(20.0),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
          ),

          itemBuilder: (context, index) {
            return Container(
              height: 80.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: ColorsConst.kCircleColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              margin: EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Positioned(
                    top: 35.0,
                    right: 20.0,
                    left: 20.0,
                    bottom: 20.0,
                    child: stack(texts, index),
                  ),
                  Positioned(
                    top: 10.0,
                    left: 20.0,
                    right: 20.0,
                    child: SvgPicture.asset(
                      texts.icons[index],
                      height: 35.0,
                      width: 35.0,

                      
                    ),
                    
                  ),
                ],
              ),
            );
          },
          itemCount: texts.list.length,
          padding: EdgeInsets.all(10.0),

          shrinkWrap: true,
        ),
      ),
    ),
  );
}

Container stack(TextConst texts, int index) {
  return Container(
    height: 30.0,
    width: 85.0,
    decoration: BoxDecoration(
      color: ColorsConst.kMainColor.withOpacity(0.4),
      borderRadius: BorderRadius.circular(12.0),
    ),
    child:Stack(
      children: [
        Positioned(
          bottom: 5.0,
          left: 10.0,
          right: 10.0,
          child: Text(
            texts.list[index],
            style: TextStyle(
              color: ColorsConst.kWhiteColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    
  );
}
