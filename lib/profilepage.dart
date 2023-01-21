import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taskly/extension.dart';
import 'package:taskly/login.dart';
import 'package:taskly/theme/ThemeService.dart';

import 'homepage.dart';

final themedata = GetStorage();

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? email;
  bool forAndroid = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    inputData();
  }

  void inputData() {
    print('sdfdf');
    final User? user = auth.currentUser;
    email = user?.email;
    print(email);
    // here you write the codes to input the data into firestore
  }

  logout() async {
    await auth.signOut(); // await GoogleSignIn().signOut();

    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return loginpage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    themedata.writeIfNull('darkmode', false);
    bool isdarkmode = themedata.read('darkmode');
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      bottomNavigationBar: Container(
        height: 100,
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, left: 15),
              child: InkWell(
                onTap: () {
                  setState(() {
                    logout();
                    print('nehil viradiya logout');
                  });
                },
                child: Text(
                  'Logout',
                  style: TextStyle(
                      color: context.theme.textTheme.headline1!.color,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.6,
                width: MediaQuery.of(context).size.width / 1,
                color: context.theme.accentColor,
                child: Column(
                  children: [
                    15.0.addHSpace(),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: homepagee()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10, top: 15),
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 130, top: 10),
                          height: 30,
                          width: 100,
                          child: Text(
                            'Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                          alignment: Alignment.center,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 45, left: 15),
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('image/images.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                    FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        future: FirebaseFirestore.instance
                            .collection('users')
                            .where('Email', isEqualTo: email)
                            .limit(1)
                            .get(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return GFLoader(type: GFLoaderType.ios);
                          }
                          final data = snapshot.data!.docs;

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 80,
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 25, left: 10),
                                      child: Text(
                                        '${data.first['name']}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 25),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        '${data.first['Email']}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        })
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 15),
                child: Text(
                  'Settings',
                  style: TextStyle(
                      color: context.theme.textTheme.headline1!.color,
                      fontWeight: FontWeight.w900,
                      fontSize: 25),
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 15),
                child: Text(
                  'Theme:',
                  style: TextStyle(
                      color: context.theme.textTheme.headline4!.color,
                      fontWeight: FontWeight.normal,
                      fontSize: 19),
                ),
                alignment: Alignment.center,
              ),

              ElevatedButton(

                  onPressed:ThemeService().switchTheme,
                  child: const Text('Change Theme')),
              // Container(
              //   child: Switch(
              //     value: isdarkmode,
              //     onChanged: (value) {
              //       setState(() {
              //         isdarkmode=value;
              //         ThemeService().switchTheme;
              //       });
              //     },
              //   ),
              // ),

              // GFToggle(
              //   value: isdarkmode,
              //   onChanged: (value) {
              //     setState(() {
              //       ThemeService().switchTheme;
              //     });
              //     // setState(() {
              //     //   isdarkmode = value!;
              //     // });
              //     isdarkmode
              //         ? Get.changeThemeMode(ThemeMode.light)
              //         : Get.changeThemeMode(ThemeMode.dark);
              //     themedata.write('darkmode', value);
              //   },
              //   enabledThumbColor: Color(0xffFF7E1C),
              //   enabledTrackColor: Color(0xff8F4A1F),
              //   disabledThumbColor: Color(0xff666AFF),
              //   disabledTrackColor:
              //       isdarkmode ? Color(0xffFF7E1C) : Color(0xff666AFF),
              // )
            ],
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Divider(
              height: 20,
              thickness: 0,
              color: Colors.black87,
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 0, left: 15),
                child: Text(
                  'Account',
                  style: TextStyle(
                      color:context.theme.textTheme.headline1!.color,
                      fontWeight: FontWeight.w900,
                      fontSize: 24),
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 15),
                child: Text(
                  'Delete user data',
                  style: TextStyle(
                      color: context.theme.textTheme.headline2?.color,
                      fontWeight: FontWeight.normal,
                      fontSize: 17),
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 15),
                child: Text(
                  'Delete account',
                  style: TextStyle(
                      color: context.theme.textTheme.headline2?.color,
                      fontWeight: FontWeight.normal,
                      fontSize: 17),
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
