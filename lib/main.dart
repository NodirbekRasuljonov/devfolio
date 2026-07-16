import 'package:devfolio/const/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'firebase_options.dart';
import 'src/url_strategy_stub.dart'
    if (dart.library.js_interop) 'src/url_strategy_web.dart' as url_strategy;

void main() async {
  url_strategy.configureUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (kIsWeb) {
      // On web we must provide FirebaseOptions. The generated
      // `firebase_options.dart` (from `flutterfire configure`) exposes
      // `DefaultFirebaseOptions.currentPlatform`.
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } else {
      await Firebase.initializeApp();
    }
  } catch (e, st) {
    debugPrint('Firebase initialization skipped: $e');
    debugPrint('$st');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key, });


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRoutes appRoutes = AppRoutes();
    return MaterialApp(
      title: 'DevFolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: appRoutes.onGenerateRoute,
      initialRoute: "/home",
    
    );
  }
}