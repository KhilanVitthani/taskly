import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taskly/profilepage.dart';
import 'package:taskly/searchpage.dart';
import 'package:taskly/taskdetailspage.dart';

import 'cc.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime now = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputData();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  String? email;
  int currnasize = 100;
  int? index;
  DateTime? today;
  String? dateeee;

  void inputData() {
    print('sdfdf');
    final User? user = auth.currentUser;
    email = user?.email;
    print(email);
    var uu = FirebaseFirestore.instance
        .collection('users')
        .where('Email', isEqualTo: email)
        .limit(1)
        .get();
    print("-->${uu}");
    // here you write the codes to input the data into firestore
  }

  String timeAgo(DateTime today) {
    Duration diff = DateTime.now().difference(today);
    print(diff);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    }
    return "a moment ago";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 1,
                    color: context.theme.accentColor,
                    child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
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
                          print("name --->${data.first.data()} ");
                          // print("name ---> ${data[0]["name"]}");
                          return Column(
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .bottomToTop,
                                              child: Profilepage()));
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 15, left: 15),
                                      height: 75,
                                      width: 75,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'image/images.jpg'),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  Container(
                                    height: 80,
                                    width: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 25, left: 10),
                                          child: Text(
                                            '${data.first['name']}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 25),
                                          ),
                                          alignment: Alignment.centerLeft,
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
                                          alignment: Alignment.centerLeft,
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .topToBottom,
                                              child: Searchpage()));
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 45, top: 10),
                                      height: 50,
                                      width: 50,
                                      child: Center(
                                        child: Icon(
                                          Icons.search_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 20),
                                    height: 20,
                                    width: 200,
                                    child: Text(
                                      'Today ${DateFormat.MMMEd().format(now)}.',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    height: 30,
                                    width: 200,
                                    child: Text(
                                      'Taskly Dashboard',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                ],
                              )
                            ],
                          );
                        }),
                  )
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 15),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Color(0xffFF0061),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 8),
                        height: 20,
                        width: 270,
                        child: Text(
                          'Active',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 19,
                              color: context.theme.textTheme.headline3!.color),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xffA4A4A4),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10, top: 7),
                              child: Icon(Icons.add, color: Color(0xffA4A4A4)))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 6),
                    child: Text(
                      'No active tasks',
                      style: TextStyle(color: Color(0xffBABABA)),
                    ),
                  ),
                ],
              ),
              // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              //   stream:
              //       FirebaseFirestore.instance.collection('task').snapshots(),
              //   builder: (context, snapshot) {
              //     if (!snapshot.hasData) {
              //       return GFLoader(type: GFLoaderType.ios);
              //     }
              //     final taskdata = snapshot.data!.docs;
              //     print("name --->${taskdata[0]} ");
              //     print("name ---> ${taskdata[0]["date"]}");
              //     print("description ---> ${taskdata[0]["description"]}");
              //     print("title ---> ${taskdata[0]["title"]}");
              //
              //     return Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         // Container(
              //         //   margin: EdgeInsets.only(left: 20, top: 6),
              //         //   child: Text(
              //         //     'No active tasks',
              //         //     style: TextStyle(color: Color(0xffBABABA)),
              //         //   ),
              //         // )
              //         // Container(
              //         //   height: 100,
              //         //   child: ListView.builder(
              //         //     itemBuilder: (context, index) {
              //         //       return Text('nehil viradiya');
              //         //     },
              //         //   ),
              //         // )
              //         InkWell(
              //           onTap: () {
              //             Navigator.push(context, MaterialPageRoute(
              //               builder: (context) {
              //                 return Taskdetail();
              //               },
              //             ));
              //           },
              //           child: Container(
              //             margin: EdgeInsets.all(9),
              //             height: 40,
              //             width: 360,
              //             decoration: BoxDecoration(
              //                 color: context.theme.unselectedWidgetColor,
              //                 borderRadius: BorderRadius.circular(6)),
              //             child: ListTile(
              //               title: Container(
              //                   margin: EdgeInsets.only(bottom: 10),
              //                   child: Text(
              //                     'Nehil',
              //                     style: TextStyle(
              //                         color:
              //                         context.theme.textTheme.headline3!.color),
              //                   )),
              //               leading: Container(
              //                 margin: EdgeInsets.only(bottom: 10),
              //                 child: Icon(
              //                   Icons.note_alt,
              //                   size: 30,
              //                   color: context.theme.accentColor,
              //                 ),
              //               ),
              //               trailing: Container(
              //                   margin: EdgeInsets.only(bottom: 10),
              //                   child: Text(
              //                     '22 hours ago',
              //                     style: TextStyle(color: Colors.black38),
              //                   )),
              //             ),
              //           ),
              //         )
              //       ],
              //     );
              //   },
              // ),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 15),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Color(0xffFFBE00),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 8),
                        height: 22,
                        width: 270,
                        child: Text(
                          'Pending To -Dos',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 19,
                              color: context.theme.textTheme.headline3!.color),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xffA4A4A4),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10, top: 7),
                              child: Icon(Icons.add, color: Color(0xffA4A4A4)))
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc('WPUa8RSxvsA8mGfFhvqp')
                    .collection('pending')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return GFLoader(type: GFLoaderType.ios);
                  }
                  final taskdata = snapshot.data!.docs;
                  print('total=======${taskdata.length}');
                  // print("${today.toString()}");

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   margin: EdgeInsets.only(left: 20, top: 6),
                      //   child: Text(
                      //     'No active tasks',
                      //     style: TextStyle(color: Color(0xffBABABA)),
                      //   ),
                      // )
                      // Container(
                      //   height: 100,
                      //   child: ListView.builder(
                      //     itemBuilder: (context, index) {
                      //       return Text('nehil viradiya');
                      //     },
                      //   ),
                      // )
                      Container(
                        // padding:EdgeInsets.symmetric(vertical: 20),
                        height: 100,
                        width: 360,
                        child: ListView.builder(
                          itemCount: taskdata.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                //print('${taskdata[index].data()['date']}');
                                setState(() {
                                  dateeee = taskdata[index].data()['date'];
                                  print(dateeee);
                                });

                                //today=DateTime.tryParse(timeAgo(taskdata[index].data()['date']));
                                // print(today);

                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Taskdetail(taskdata, index);
                                  },
                                ));
                              },
                              child: Container(
                                margin: EdgeInsets.all(9),
                                height: 50,
                                width: 360,
                                decoration: BoxDecoration(
                                    color: context.theme.unselectedWidgetColor,
                                    borderRadius: BorderRadius.circular(6)),
                                child: ListTile(
                                  title: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        '${taskdata[index].data()['title']}',
                                        style: TextStyle(
                                            color: context.theme.textTheme
                                                .headline3!.color),
                                      )),
                                  leading: Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Icon(
                                      Icons.note_alt,
                                      size: 30,
                                      color: context.theme.accentColor,
                                    ),
                                  ),
                                  trailing: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        '',
                                        style: TextStyle(
                                            color: context.theme.textTheme
                                                .headline6!.color),
                                      )),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                },
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         Navigator.push(context, MaterialPageRoute(
              //           builder: (context) {
              //             return Taskdetail();
              //           },
              //         ));
              //       },
              //       child: Container(
              //         margin: EdgeInsets.all(9),
              //         height: 40,
              //         width: 360,
              //         decoration: BoxDecoration(
              //             color: context.theme.unselectedWidgetColor,
              //             borderRadius: BorderRadius.circular(6)),
              //         child: ListTile(
              //           title: Container(
              //               margin: EdgeInsets.only(bottom: 10),
              //               child: Text('Nehil')),
              //           leading: Container(
              //             margin: EdgeInsets.only(bottom: 10),
              //             child: Icon(
              //               Icons.note_alt,
              //               size: 30,
              //               color: context.theme.accentColor,
              //             ),
              //           ),
              //           trailing: Container(
              //               margin: EdgeInsets.only(bottom: 10),
              //               child: Text(
              //                 '22 hours ago',
              //                 style: TextStyle(color: Colors.black38),
              //               )),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 15),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Color(0xff00B341),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 8),
                    height: 22,
                    width: 270,
                    child: Text(
                      'Completed',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: context.theme.textTheme.headline3!.color),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xffA4A4A4),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10, top: 7),
                          child: Icon(Icons.add, color: Color(0xffA4A4A4)))
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 6),
                    child: Text(
                      'You have no completed any tasks yet!',
                      style: TextStyle(color: Color(0xffBABABA)),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    // timeAgo;

                    DateTime dateTime1 =
                        DateFormat('d/M/y').parse(dateeee ?? "");
                    print('${dateTime1}');

                    print('DATE========================${dateeee}');
                  },
                  child: Text('nehil'))
            ],
          ),
        ),
      ),
    );
  }
}
