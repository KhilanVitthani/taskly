import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taskly/login.dart';

class Singuppage extends StatefulWidget {
  const Singuppage({Key? key}) : super(key: key);

  @override
  State<Singuppage> createState() => _SinguppageState();
}

class _SinguppageState extends State<Singuppage> {
  final formKey = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');





    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: 800,
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      child: loginpage()));
                            },
                            icon: Icon(Icons.arrow_back)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 90),
                        height: 40,
                        width: 120,
                        child: Text(
                          'New user?',
                          style: TextStyle(
                              color: Color(0xff676AF7),
                              fontSize: 17,
                              fontWeight: FontWeight.w900),
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 7),
                        child: Text(
                          'Create an account.',
                          style: TextStyle(
                              color: Color(0xff676AF7),
                              fontSize: 23,
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
                          'Hi, pleace create an account to cuntinue using the\napp!',
                          style: TextStyle(
                            color: Color(0xff999999),
                            fontSize: 16,
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
                          'USERNAME',
                          style: TextStyle(
                              color: Color(0xff676AF7),
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        ),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.all(17),
                      decoration: BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter USERNAME";
                            } else {
                              value = null;
                            }
                          },
                          controller: username,
                          cursorColor: Color(0xff676AF7),
                          decoration: InputDecoration(
                              hintText: 'Enter your username...',
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )))),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
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
                      margin: EdgeInsets.all(17),
                      decoration: BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            } else {
                              value = null;
                            }
                          },
                          controller: email,
                          cursorColor: Color(0xff676AF7),
                          decoration: InputDecoration(
                              hintText: 'Enter your email address...',
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )))),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          'PASSWORD',
                          style: TextStyle(
                              color: Color(0xff676AF7),
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        ),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.all(17),
                      decoration: BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter password";
                            } else {
                              value = null;
                            }
                          },
                          controller: password,
                          cursorColor: Color(0xff676AF7),
                          decoration: InputDecoration(
                              hintText: 'Enter your password...',
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )))),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          'PHONE',
                          style: TextStyle(
                              color: Color(0xff676AF7),
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        ),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.all(17),
                      decoration: BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter phone number ";
                            } else {
                              value = null;
                            }
                          },
                          controller: phone,
                          cursorColor: Color(0xff676AF7),
                          decoration: InputDecoration(
                              hintText: 'Enter your phone number...',
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )))),
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          if(formKey.currentState!.validate() ){
                            // await FirebaseAuth.instance
                            //     .signInWithEmailAndPassword(
                            //     email: email.text, password: password.text);
                            try {
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
                              );



                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                print('The account already exists for that email.');
                                Fluttertoast.showToast(
                                    msg:
                                    "The account already exists for that email try again",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Color(0xff0E47A1),
                                    textColor: Colors.white,
                                    fontSize: 16.0);

                              }
                            } catch (e) {
                              print(e);
                            }
                           print('nehilviradiya');
                            await users.add({
                              'name': '${username.text}',
                              'Email': '${email.text}',
                              'password': '${password.text}'


                            }).then((value) => print('user added'));
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.size,
                                    alignment: Alignment.bottomCenter,
                                    child: loginpage()));

                          }
                          else {
                            formKey.currentState?.save();
                            Fluttertoast.showToast(
                                msg:
                                "Enter the value.",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor:Color(0xff0E47A1),
                                textColor: Colors.white,
                                fontSize: 16.0);
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
                            'Singup',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                      // ElevatedButton(
                      //     onPressed: () async {
                      //       await users.add({
                      //         'name': '${email.text}',
                      //         'Email': '${username.text}'
                      //       }).then((value) => print('user added'));
                      //     },
                      //     child: Text('nehuil'))
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
                                color: Color(0xff2F466A),
                                shape: BoxShape.circle),
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
                                color: Color(0xffF04535),
                                shape: BoxShape.circle),
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
                                color: Color(0xff000000),
                                shape: BoxShape.circle),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
}
