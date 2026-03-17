import 'package:devfolio/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:on_click/on_click.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex=2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConst.kMainColor,
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Dev",
                  style: TextStyle(
                    color: ColorsConst.kWhiteColor,
                    fontSize: 22.0,
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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorsConst.kMainColor,
          items: [
            BottomNavigationBarItem(
             
              icon: SvgPicture.asset("assets/svg/home.svg"),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/projects.svg"),
              label: "Projects",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/cv.svg"),
              label: "Resume",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/contact.svg"),
              label: "Contact",
            ),
          ],
          selectedItemColor: ColorsConst.kCircleColor.withOpacity(0.9),
          selectedIconTheme: IconThemeData(
            color: ColorsConst.kCircleColor.withOpacity(0.9),
            ),
            currentIndex:selectedIndex ,
            onTap: (index){
              selectedIndex=index;
            },
        ),
      ),
    );
  }
}
