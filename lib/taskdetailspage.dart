import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'home.dart';
import 'homepage.dart';

class Taskdetail extends StatefulWidget {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> taskdata;
  int index;
  Taskdetail(this.taskdata, this.index);

  @override
  State<Taskdetail> createState() => _TaskdetailState();
}

class _TaskdetailState extends State<Taskdetail> {
  CollectionReference users = FirebaseFirestore.instance.collection('task');

  Future<void> deleteUser() {
    return users
        .doc('${widget.taskdata[widget.index].data()}')
        .delete()
        .then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Home();
        },
      ));
      print("User Deleted");
    }).catchError((error) => print("Failed to delete user: $error"));
  }

  List status = ['Active', 'Pending', 'Completed'];
  int tag = 1;
  List<String> options = ['Active', 'Pending', 'Completed'];
  List<String>? selectedHobby = [];
  int? _value = 1;
  bool isSelected = false;

  final FirebaseAuth auth = FirebaseAuth.instance;
  String? email;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
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
                    margin: EdgeInsets.only(left: 70, top: 10),
                    height: 30,
                    width: 180,
                    child: Text(
                      'Task details',
                      style: TextStyle(
                          color: context.theme.accentColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                    alignment: Alignment.center,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: IconButton(
                        onPressed: () {
                          // setState(() {
                          //   deleteUser();
                          // });
                        },
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.red,
                          size: 30,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: context.theme.accentColor,
                          size: 30,
                        )),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'Title',
                      style: TextStyle(
                          color: context.theme.accentColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      '${widget.taskdata[widget.index].data()['title']}',
                      style: TextStyle(
                          color: context.theme.textTheme.headline6?.color,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'Description',
                      style: TextStyle(
                          color: context.theme.accentColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "${widget.taskdata[widget.index].data()['description']}",
                      style: TextStyle(
                          color: context.theme.textTheme.headline6?.color,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'Event date',
                      style: TextStyle(
                          color: context.theme.accentColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      "${widget.taskdata[widget.index].data()['date']}",
                      style: TextStyle(
                          color: context.theme.textTheme.headline6?.color,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'Status',
                      style: TextStyle(
                          color: context.theme.accentColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
              // Wrap(
              //   // list of length 3
              //   children: List.generate(
              //     3,
              //         (int index) {
              //       // choice chip allow us to
              //       // set its properties.
              //       return ChoiceChip(
              //
              //         padding: EdgeInsets.all(8),
              //         label: Text('Item $index'),
              //         // color of selected chip
              //         selectedColor: Colors.green,
              //         // selected chip value
              //         selected: _value == index,
              //         // onselected method
              //         onSelected: (bool selected) {
              //           setState(() {
              //             _value = selected ? index : null;
              //           });
              //         },
              //       );
              //     },
              //   ).toList(),
              // ),

              // Wrap(
              //   children: options.map(
              //     (hobby) {
              //       bool isSelected = false;
              //       if (selectedHobby!.contains(hobby)) {
              //         isSelected = true;
              //
              //       }
              //
              //
              //       return GestureDetector(
              //           onTap: () {
              //             if (!selectedHobby!.contains(hobby)) {
              //               if (selectedHobby!.length < 1) {
              //                 selectedHobby!.add(hobby);
              //
              //                 setState(() {});
              //                 print(selectedHobby);
              //               }
              //             }
              //             else {
              //               selectedHobby!
              //                   .removeWhere((element) => element == hobby);
              //               setState(() {});
              //               print(selectedHobby);
              //             }
              //           },
              //           child: Container(
              //             margin: EdgeInsets.only(
              //               left: 20,
              //               right: 20,
              //               top: 10,
              //             ),
              //             height: 60,
              //             width: 370,
              //             decoration: BoxDecoration(
              //                 color: isSelected
              //                     ? const Color(0xff868AFC)
              //                     : Colors.grey[100],
              //                 border:
              //                     Border.all(color: Color(0xff868AFC), width: 3),
              //                 borderRadius: BorderRadius.circular(10)),
              //             child: Text(
              //               hobby,
              //               style: TextStyle(
              //                   color:
              //                       isSelected ? Colors.white : Color(0xff868AFC),
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 17),
              //             ),
              //             alignment: Alignment.center,
              //           ));
              //     },
              //   ).toList(),
              // ),
              // Container(
              //
              //   margin: EdgeInsets.all(5),
              //   width: 300,
              //   height: 60,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Color(0xff868AFC), width: 3),
              //     borderRadius: BorderRadius.circular(10),
              //     color: isSelected
              //         ? const Color(0xff868AFC)
              //         : Colors.grey[100],
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Container(
              //
              //         child: Text(
              //           hobby,
              //           style: TextStyle(
              //               color: isSelected
              //                   ? Colors.white
              //                   : Color(0xff868AFC),
              //               fontWeight: FontWeight.bold,
              //               fontSize: 14),
              //         ),
              //         alignment: Alignment.center,
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(top: 10),
              //   height: 240,
              //   width: 370,
              //   child: ListView.builder(
              //     itemCount: status.length,
              //     itemBuilder: (context, index) {
              //       return Expanded(
              //         child: Container(
              //           margin: EdgeInsets.all(10),
              //           decoration: BoxDecoration(
              //               border: Border.all(
              //                   color: context.theme.accentColor, width: 3),
              //               borderRadius: BorderRadius.circular(10)),
              //           child: Expanded(
              //             child: ChoiceChip(
              //               label: Text(
              //                 '${status[index]}',
              //                 style: TextStyle(
              //                     color: Color(0xff868AFC),
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 17),
              //               ),
              //               selected: tag == index,
              //               selectedColor: Colors.greenAccent,
              //               onSelected: (bool selected) {
              //                 setState(() {
              //                   tag = selected ? index : 0;
              //                 });
              //               },
              //               labelStyle: TextStyle(color: Colors.white),
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // )
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ToggleSwitch(
                  minHeight: 50,
                  activeBorders: [
                    Border.all(
                      color: context.theme.accentColor,
                      width: 3.0,
                    ),
                    Border.all(
                      color: context.theme.accentColor,
                      width: 3.0,
                    ),
                    Border.all(
                      color: context.theme.accentColor,
                      width: 3.0,
                    ),
                  ],
                  activeFgColor: Colors.white,
                  isVertical: true,
                  minWidth: 350.0,
                  radiusStyle: true,
                  cornerRadius: 20.0,
                  initialLabelIndex:
                      (widget.taskdata[widget.index].data()['status'] ==
                              'active')
                          ? 0
                          : (widget.taskdata[widget.index].data()['status'] ==
                                  'complete')
                              ? 2
                              : 1,
                  activeBgColors: [
                    [
                      context.theme.accentColor,
                    ],
                    [
                      context.theme.accentColor,
                    ],
                    [
                      context.theme.accentColor,
                    ],
                  ],
                  labels: ['Active', 'Pending', 'Completed'],
                  onToggle: (index) {
                    print('switched to: $index');
                    if (widget.taskdata[widget.index].data()['status'] ==
                        'pending') {
                      deletePending(
                              id: widget.taskdata[widget.index].data()['uId'])
                          .then((value) {
                        print("object");
                      });
                      if (index == 0) {
                        print("Active");
                        addDataToActive(
                            id: widget.taskdata[widget.index].data()['uId']);
                      } else {
                        print("complete");
                        addDataToComplete(
                            id: widget.taskdata[widget.index].data()['uId']);
                      }
                    }
                    if (widget.taskdata[widget.index].data()['status'] ==
                        'active') {
                      deleteActive(
                              id: widget.taskdata[widget.index].data()['uId'])
                          .then((value) {
                        print("object");
                      });
                      if (index == 1) {
                        print("pending");
                        addDataToPending(
                            id: widget.taskdata[widget.index].data()['uId']);
                      } else {
                        print("complete");
                        addDataToComplete(
                            id: widget.taskdata[widget.index].data()['uId']);
                      }
                    }
                    if (widget.taskdata[widget.index].data()['status'] ==
                        'complete') {
                      deleteComplete(
                              id: widget.taskdata[widget.index].data()['uId'])
                          .then((value) {
                        print("object");
                      });
                      if (index == 0) {
                        print("Active");
                        addDataToActive(
                            id: widget.taskdata[widget.index].data()['uId']);
                      } else {
                        print("pending");
                        addDataToPending(
                            id: widget.taskdata[widget.index].data()['uId']);
                      }
                    }
                  },
                ),
              ),
              // ElevatedButton(onPressed: () {
              //
              //
              // }, child: Text('hff'))
            ],
          ),
        ),
      ),
    );
  }

  Future<String> deletePending({String? id}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users
        .doc('WPUa8RSxvsA8mGfFhvqp')
        .collection('pending')
        .doc(id)
        .delete()
        .then((value) => (value) {
              print('NEHIL');
            });
    return 'success';
  }

  Future<String> deleteActive({String? id}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    String id = users.doc().id;
    print(id);
    users
        .doc('WPUa8RSxvsA8mGfFhvqp')
        .collection('pending')
        .doc(id)
        .delete()
        .then((value) => (value) {
              print('NEHIL');
            });
    return 'success';
  }

  Future<String> deleteComplete({String? id}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    String id = users.doc().id;
    print(id);
    users
        .doc('WPUa8RSxvsA8mGfFhvqp')
        .collection('pending')
        .doc(id)
        .delete()
        .then((value) => (value) {
              print('NEHIL');
            });
    return 'success';
  }

  Future<String> addDataToActive({String? id}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    print(id);
    users.doc('WPUa8RSxvsA8mGfFhvqp').collection('active').doc(id).set({
      'title': '${widget.taskdata[widget.index].data()['title']}',
      'description': '${widget.taskdata[widget.index].data()['description']}',
      'date': '${widget.taskdata[widget.index].data()['data']}',
      'time': '${widget.taskdata[widget.index].data()['time']}',
      'status': 'active',
      'uId': '${widget.taskdata[widget.index].data()['uId']}',
    }).then((value) => (value) {
          print('NEHIL');
        });

    return 'success';
  }

  Future<String> addDataToComplete({String? id}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    print(id);
    users.doc('WPUa8RSxvsA8mGfFhvqp').collection('Complete').doc(id).set({
      'title': '${widget.taskdata[widget.index].data()['title']}',
      'description': '${widget.taskdata[widget.index].data()['description']}',
      'date': '${widget.taskdata[widget.index].data()['date']}',
      'time': '${widget.taskdata[widget.index].data()['time']}',
      'status': 'complete',
      'uId': '${widget.taskdata[widget.index].data()['uId']}',
    }).then((value) => (value) {
          print('NEHIL');
        });

    return 'success';
  }

  Future<String> addDataToPending({String? id}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    print(id);
    users.doc('WPUa8RSxvsA8mGfFhvqp').collection('Pending').doc(id).set({
      'title': '${widget.taskdata[widget.index].data()['title']}',
      'description': '${widget.taskdata[widget.index].data()['description']}',
      'date': '${widget.taskdata[widget.index].data()['data']}',
      'time': '${widget.taskdata[widget.index].data()['time']}',
      'status': 'complete',
      'uId': '${widget.taskdata[widget.index].data()['uId']}',
    }).then((value) => (value) {
          print('NEHIL');
        });

    return 'success';
  }
}
