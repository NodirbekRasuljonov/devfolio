import 'package:devfolio/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }



  @override
  Widget build(BuildContext context) {
    
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
        body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Container(
              color: ColorsConst.kMainColor,
              child: Center(
                child: Text(
                  "Page ${index + 1}",
                  style: TextStyle(
                    color: ColorsConst.kWhiteColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
        ),

        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            
            backgroundColor: ColorsConst.kMainColor,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
            items: [
              BottomNavigationBarItem(
              
                icon: SvgPicture.asset(
                  "assets/svg/home.svg",
                  color: selectedIndex == 0
                      ? ColorsConst.kCircleColor.withOpacity(0.9)
                      : ColorsConst.kWhiteColor,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/projects.svg",
                  color: selectedIndex == 1
                      ? ColorsConst.kCircleColor.withOpacity(0.9)
                      : ColorsConst.kWhiteColor,
                ),
                label: "Projects",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/cv.svg",
                  color: selectedIndex == 2
                      ? ColorsConst.kCircleColor.withOpacity(0.9)
                      : ColorsConst.kWhiteColor,
                ),
                label: "Resume",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/contact.svg",
                  color: selectedIndex == 3
                      ? ColorsConst.kCircleColor.withOpacity(0.9)
                      : ColorsConst.kWhiteColor,
                ),
                label: "Contact",
              ),
            ],
            selectedItemColor: ColorsConst.kCircleColor.withOpacity(0.9), // label color when selected
            unselectedItemColor: ColorsConst.kWhiteColor, // label color when not selected
            currentIndex: selectedIndex,
            onTap: (index) {
              debugPrint("Selected Index: $index");
              if (index != selectedIndex) {
                setState(() {
                  selectedIndex = index;
                });
                pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
      ),
    );
  }
   @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
