import 'package:devfolio/pages/homepage.dart';
import 'package:devfolio/pages/intro.dart';
import 'package:devfolio/pages/projects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/intro":
        return MaterialPageRoute(
          builder: (context) {
            return IntroPage();
          },
        );
      case "/home":
        return MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        );
      
    }
    return null;
  }
}
