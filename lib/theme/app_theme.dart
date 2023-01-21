import 'package:flutter/material.dart';


class Themes{

  static final light = ThemeData.dark().copyWith(
    brightness: Brightness.light,
    cardColor: Color(0xffFF7E1C),
    unselectedWidgetColor: Color(0xff171717),

    backgroundColor: Colors.black,
    buttonColor: Colors.white,
    bottomAppBarColor:  Color(0xffFF7E1C),
    accentColor: Color(0xffFF7E1C),/// con colro

    textTheme: TextTheme(
        headline1: const TextStyle(color: Color(0xffFAFAFA)), /// App Text Theme color set,
        headline2: const TextStyle(color: Color(0xffFF7E1C)), /// APP BAR BACK AND GO BUTTON AND TEXT THEME SET
        headline3: const TextStyle(color:Color(0xffFF7E1C)),
        headline4: const TextStyle(color:Color(0xffCECDCE)),
        headline5: const TextStyle(color:Color(0xff9F613D)),
        headline6: const TextStyle(color: Color(0xffBFBFBF)),
    ),
  );

  static final dark = ThemeData.light().copyWith(
    brightness: Brightness.dark,
    cardColor: Color(0xff666AFF),
    unselectedWidgetColor: Color(0xffDADBF9),
    backgroundColor: Colors.white,
    buttonColor:Colors.orange,
    bottomAppBarColor: Colors.brown,
    accentColor: Color(0xff666AFF), /// con colro
    colorScheme: ThemeData().colorScheme.copyWith(primary:  const Color(0xff17181A)),
    textTheme: TextTheme(
        headline1: const TextStyle(color:Color(0xff666AFF) ), /// App Text Theme color set,
        headline2: const TextStyle(color: Color(0xff666AFF)) , /// APP BAR BACK AND GO BUTTON AND TEXT THEME SET
        headline3: const TextStyle(color: Color(0xff2B446D))  ,/// APP BAR BACK AND GO BUTTON AND TEXT THEME SET
        headline4: const TextStyle(color: Color(0xffBFBFBF)) , /// APP BAR BACK AND GO BUTTON AND TEXT THEME SET
        headline5: const TextStyle(color: Color(0xffBFBFBF))  ,/// APP BAR BACK AND GO BUTTON AND TEXT THEME SET
        headline6: const TextStyle(color:Colors.black)  /// APP BAR BACK AND GO BUTTON AND TEXT THEME SET
    ),
  );


}