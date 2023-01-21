import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taskly/homepage.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  SplashscreenState createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 10),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const homepagee(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                height: 50,
                width: 140,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('image/s11.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}