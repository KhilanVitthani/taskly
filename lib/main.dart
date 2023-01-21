import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:taskly/theme/ThemeService.dart';
import 'package:taskly/theme/app_theme.dart';

import 'homepage.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  final themedata = GetStorage();
  bool ss = false;


  @override
  Widget build(BuildContext context) {
    bool darkmode = themedata.read('darkmode') ?? false;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: darkmode ?ThemeData.dark():ThemeData.light(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,

      home: FirebaseAuth.instance.currentUser != null
          ? AnimatedSplashScreen(
              splash: Center(
                child: Container(
                  height: 50,
                  width: 140,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('image/n.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              duration: 3000,
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor:
                  ThemeData == null ? Color(0xff666AFF) : Color(0xff191919),
              nextScreen: homepagee(),
            )
          : AnimatedSplashScreen(
              splash: Center(
                child: Container(
                  height: 50,
                  width: 140,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('image/n.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              duration: 3000,
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor:
                  ThemeData == null ? Color(0xff666AFF) : Color(0xff191919),
              nextScreen: loginpage(),
            ),
    );
  }
}
