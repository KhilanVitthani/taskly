import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taskly/homepage.dart';
import 'package:taskly/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,

        child: Row(
          children: [
            InkWell(
              onTap: () {
                print("next page");
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.bottomToTop,
                        child: Singuppage()));
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 50,top: 70 ),
                        child: Text(
                          'Dont "have an accoumnt?',
                          style:
                          TextStyle(color: Color(0xff999999), fontSize: 18),
                        ),
                        alignment: Alignment.center,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10,top: 70),
                        child: Text(
                          'Get Started!.',
                          style: TextStyle(
                              color: Color(0xff676AF7),
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Form(key:formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('image/lo.jpeg'),
                              fit: BoxFit.fill)),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Color(0xff676AF7),
                          fontSize: 29,
                          fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 7),
                    child: Text(
                      'Please login to continue using the app',
                      style: TextStyle(
                        color: Color(0xff999999),
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 18),
                    child: Text(
                      'EMAIL ADDRESS',
                      style: TextStyle(
                          color: Color(0xff676AF7),
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return "Enter email";
                        }
                        else
                        {
                          value=null;
                        }
                      },
                      controller: email,
                      cursorColor: Color(0xff676AF7),
                      decoration: InputDecoration(
                          hintText: 'Enter your email address...',
                          labelStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w800),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )))),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'PASSWROD',
                      style: TextStyle(
                          color: Color(0xff676AF7),
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return "Enter passwrod";
                        }
                        else
                        {
                          value=null;
                        }
                      },

                      controller: password,
                      cursorColor: Color(0xff676AF7),
                      decoration: InputDecoration(
                          hintText: 'Enter your passwrod...',
                          labelStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w800),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )))),
              Row(
                children: [
                  InkWell(onTap: () async {
                    try {
                      // final credential = await FirebaseAuth.instance
                      //     .signInWithEmailAndPassword(
                      //     email: email.text, password: password.text);
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: email.text, password: password.text);


                      print('nehilk viradiya login');
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: homepagee()));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');

                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');

                      }
                    }

                  },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 20,
                      ),
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                          color: Color(0xff676AF7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w900),
                      ),
                      alignment: Alignment.center,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      'Or login with',
                      style: TextStyle(
                        color: Color(0xff999999),
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        height: 60,
                        width: 60,
                        child: Icon(
                          Icons.facebook,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xff2F466A), shape: BoxShape.circle),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        height: 60,
                        width: 60,
                        child: Center(
                          child: SvgPicture.asset(
                            "image/googlcon.svg",
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffF04535), shape: BoxShape.circle),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        height: 60,
                        width: 60,
                        child: Center(
                          child: SvgPicture.asset(
                            "image/iphone.svg",
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xff000000), shape: BoxShape.circle),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      print("next page");
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: Singuppage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 50, top: 100),
                          child: Text(
                            'Dont "have an accoumnt?',
                            style:
                                TextStyle(color: Color(0xff999999), fontSize: 18),
                          ),
                          alignment: Alignment.center,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 100),
                          child: Text(
                            'Get Started!.',
                            style: TextStyle(
                                color: Color(0xff676AF7),
                                fontSize: 18,
                                fontWeight: FontWeight.w900),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
}
