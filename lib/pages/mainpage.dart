import 'package:devfolio/const/colors_const.dart' show ColorsConst;
import 'package:devfolio/const/textconst.dart';
import 'package:flutter/material.dart';

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
          ),
          itemBuilder: (context, index) {
            return Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: ColorsConst.kCircleColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              margin: EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Positioned(
                    child: Text(
                      texts.list[index],
                      style: TextStyle(
                        color: ColorsConst.kWhiteColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    bottom: 10.0,
                    left: 10.0,
                  ),
                  Positioned(
                    child: Image.asset(texts.icons[index]),
                    top: 10.0,
                    right: 10.0,
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
