import 'package:devfolio/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:on_click/extensions/click_extension.dart';

Scaffold ContactPage({
  required TextEditingController nameController,
  required TextEditingController emailController,
  required messageController,
}) {
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
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            contactCard(
              title: "EMAIL ME",
              subtitle: "nodirbekmaqsudjonovich@gmail.com",
              icon: Icons.email_outlined,
              onTab: () {
                debugPrint("email Pressed");
              },
            ),
            SizedBox(height: 20.0),
            contactCard(
              title: "CALL ME",
              subtitle: "+48 51 733 87 92",
              icon: Icons.phone_outlined,
              onTab: () {
                debugPrint("Phone Pressed");
              },
            ),
            Container(
              height: 500.0,
              width: double.infinity,
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Send a Message",
                    style: TextStyle(
                      color: ColorsConst.kWhiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    "I typically respond within 24 hours",
                    style: TextStyle(
                      color: ColorsConst.kTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                    ),
                  ),
                  inputs(inputController: nameController, label: "FULL NAME", hint: "John Doe"),
                  SizedBox(height: 20.0,),
                  inputs(inputController: emailController, label: "EMAIL ADDRESS ", hint: "john@example.com")
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

SizedBox inputs({required TextEditingController inputController,required String label,required String hint}) {
  return SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          color: ColorsConst.kTextColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextFormField(
                        controller: inputController,
                        cursorColor: ColorsConst.kCircleColor.withValues(alpha: 0.9),
                        textAlign: TextAlign.left,
                        style: TextStyle(color: ColorsConst.kWhiteColor),
                        
                        decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: TextStyle(color: ColorsConst.kTextColor),
                        
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: ColorsConst.kCircleColor.withValues(alpha: 0.9),

                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: ColorsConst.kCircleColor.withValues(alpha: 0.9),
                            ),
                          ),
                          fillColor: ColorsConst.kTextColor,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorsConst.kCircleColor.withValues(alpha: 0.9),
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
}

Widget contactCard({
  required String title,
  required String subtitle,
  required IconData icon,
  required VoidCallback onTab,
}) {
  return Container(
    height: 90.0,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: ColorsConst.kCircleColor.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: ListTile(
      titleTextStyle: TextStyle(
        color: ColorsConst.kCircleColor.withValues(alpha: 0.9),
      ),
      subtitleTextStyle: TextStyle(
        color: ColorsConst.kWhiteColor,
        fontWeight: FontWeight.w400,
      ),
      iconColor: ColorsConst.kWhiteColor,
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(
          icon,
          color: ColorsConst.kCircleColor.withValues(alpha: 0.9),
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_outward_outlined),
    ),
  ).onClick(onTab);
}
