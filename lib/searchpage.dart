import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taskly/extension.dart';
import 'package:taskly/taskdetailspage.dart';

import 'homepage.dart';

class Searchpage extends StatefulWidget {
  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                10.0.addHSpace(),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 1,
                  color: context.theme.accentColor,
                  child: Column(
                    children: [
                      10.0.addHSpace(),
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
                              margin: EdgeInsets.only(left: 10, top: 25),
                              child: Icon(Icons.arrow_back),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 130, top: 25),
                            height: 30,
                            width: 100,
                            child: Text(
                              'Search',
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
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15, top: 18),
                            height: 50,
                            width: 260,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: TextField(
                                cursorColor: Colors.white,
                                controller: search,
                                onSubmitted: (value) {
                                  setState(() {
                                    name = value;
                                  });
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Enter the Query',
                                  hintStyle: TextStyle(color: Colors.white54),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // name.isEmpty;
                              setState(() {});
                              print('Nehil viradiya');
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20, top: 25),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(left: 20, top: 10),
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
                      )
                    ],
                  ),
                )
              ],
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc('WPUa8RSxvsA8mGfFhvqp')
                  .collection('task')
                  .snapshots(),
              builder: (context, snapshot) {
                final taskdata = snapshot.data!.docs;

                // print("name --->${taskdata[0]} ");
                // print("name ---> ${taskdata[0]["date"]}");
                // print("description ---> ${taskdata[0]["description"]}");
                // print("title ---> ${taskdata[0]["title"]}");
                if (snapshot.hasError) {
                  return Center(child: Text('Something went wrong'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (name.isEmpty) {
                  return Container();
                }
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
                      height: 680,
                      width: 360,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          if (name.isEmpty) {
                            return InkWell(
                              onTap: () {
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
                          }
                          if (taskdata[index]
                              .data()['title']
                              .toString()
                              .toLowerCase()
                              .startsWith(name.toLowerCase())) {
                            return InkWell(
                              onTap: () {
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
                                        '22 hours ago',
                                        style: TextStyle(
                                            color: context.theme.textTheme
                                                .headline6!.color),
                                      )),
                                ),
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  TextEditingController search = TextEditingController();
}
