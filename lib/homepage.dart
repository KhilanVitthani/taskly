import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskly/complepage.dart';
import 'home.dart';

class homepagee extends StatefulWidget {
  const homepagee({Key? key}) : super(key: key);

  @override
  State<homepagee> createState() => _homepageeState();
}

class _homepageeState extends State<homepagee> {
  int _selectedIndex = 0;
  DateTime now = DateTime.now();
  DateTime dateTime = DateTime.now();
  // CollectionReference users = FirebaseFirestore.instance.collection('task');

  String? id;
  // String id=FirebaseFirestore.instance.collection('users').doc('0gNWxzzuaBLHvWxqlJak').collection('task').doc().toString();
  // var  users = FirebaseFirestore.instance.collection('users').doc('0gNWxzzuaBLHvWxqlJak').collection('task').doc(FirebaseFirestore.instance.collection('users').doc('0gNWxzzuaBLHvWxqlJak').collection('task').doc().toString()).snapshots();
  //  CollectionReference users = FirebaseFirestore.instance.collection('task');

  Future<String> addmaltipalcollection({String? id}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    String id = users.doc().id;
    print(id);
    users.doc('WPUa8RSxvsA8mGfFhvqp').collection('pending').doc(id).set({
      'title': '${title.text}',
      'description': '${description.text}',
      'date': '${dataa}',
      'time': '${now.hour}:${now.minute}',
      'status': 'pending',
      'uId': '${id}',
    }).then((value) => (value) {
          print('NEHIL');
        });

    return 'success';
  }

  // Future<String> usercollection({String? id}) async {
  //   CollectionReference users = FirebaseFirestore.instance.collection('users');
  //   var result =await users.add({
  //     'name': 'nehil',
  //     'sname': 'viradiya ',
  //     'date': '12/2/2022'
  //
  //
  //   });
  //
  //   addmaltipalcollection(
  //     id: result.id
  //   );
  //
  //
  //   return 'created';
  // }

  String? dataa;
  String? sdataa;
  bool ss = false;

  List adddata = [];

  // CollectionReference users = FirebaseFirestore.instance.collection('users');

  // Future<void> addUser() {
  //   return users
  //       .doc('task')
  //       .set({
  //     'title': '${title.text}',
  //     'description': '${description.text}',
  //     'date': '${dataa}'
  //   })
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  final ScrollController _homeController = ScrollController();
  final List<Widget> _widgetOptions = [Home(), Complepage()];
  DateTime selectedDate = DateTime.now();

  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      //which date will display when user open the picker
      firstDate: DateTime(1950),
      //what will be the previous supported year in picker
      lastDate: DateTime(2300),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: context.theme.accentColor,
              // <-- SEE HERE
              onPrimary: Colors.white,
              // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Color(0xff0E47A1), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    )
        //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        selectedDate = pickedDate;
        sdataa = selectedDate.toString();
        sdataa = DateFormat.yMMMd().format(selectedDate);
      });
      print(selectedDate);
      print(sdataa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return Dialog(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      child: SingleChildScrollView(
                        child: Container(
                          height: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10, left: 20),
                                    child: Text(
                                      'Adding a Task',
                                      style: TextStyle(
                                          color: context
                                              .theme.textTheme.headline2?.color,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 20),
                                    child: Text(
                                      'Title',
                                      style: TextStyle(
                                          color: context
                                              .theme.textTheme.headline2?.color,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                                  decoration: BoxDecoration(
                                      color: context.theme.backgroundColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextField(
                                      controller: title,
                                      style: TextStyle(
                                        color: context
                                            .theme.textTheme.headline6?.color,
                                      ),
                                      cursorColor: context
                                          .theme.textTheme.headline2?.color,
                                      decoration: InputDecoration(
                                          hintText: 'Enter your Title ',
                                          labelStyle: TextStyle(
                                              color: context.theme.textTheme
                                                  .headline2?.color,
                                              fontWeight: FontWeight.w800),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )))),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 1),
                                    child: Text(
                                      'Description',
                                      style: TextStyle(
                                          color: context
                                              .theme.textTheme.headline2?.color,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                                  decoration: BoxDecoration(
                                      color: context.theme.backgroundColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextField(
                                      controller: description,
                                      maxLines: 5,
                                      style: TextStyle(
                                        color: context
                                            .theme.textTheme.headline6?.color,
                                      ),
                                      cursorColor: context
                                          .theme.textTheme.headline2?.color,
                                      decoration: InputDecoration(
                                          hintText: 'Enter your Title ',
                                          labelStyle: TextStyle(
                                              color: context.theme.textTheme
                                                  .headline2?.color,
                                              fontWeight: FontWeight.w800),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )))),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 1),
                                    child: Text(
                                      'Event date',
                                      style: TextStyle(
                                          color: context
                                              .theme.textTheme.headline2?.color,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  )
                                ],
                              ),
                              dataa == null
                                  ? Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              dataa = DateFormat.MMMEd()
                                                  .format(now);
                                            });
                                            print(dataa);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 20, top: 10, right: 0),
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: context.theme.textTheme
                                                    .headline2?.color,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              'Today',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            print('nehilviradiya');
                                            // final DateTime? picked =
                                            //     await showDatePicker(
                                            //   context: context,
                                            //   initialDate: DateTime.now(),
                                            //   firstDate: DateTime(1900),
                                            //   lastDate: DateTime(2300),
                                            //
                                            //   builder: (context, child) {
                                            //     return Theme(
                                            //       data: Theme.of(context)
                                            //           .copyWith(
                                            //         colorScheme:
                                            //             ColorScheme.light(
                                            //           primary:
                                            //               Color(0xff666AFF),
                                            //           // <-- SEE HERE
                                            //           onPrimary: Colors.white,
                                            //           // <-- SEE HERE
                                            //           onSurface: Colors
                                            //               .black, // <-- SEE HERE
                                            //         ),
                                            //         textButtonTheme:
                                            //             TextButtonThemeData(
                                            //           style:
                                            //               TextButton.styleFrom(
                                            //             primary: Color(
                                            //                 0xff0E47A1), // button text color
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       child: child!,
                                            //     );
                                            //   },
                                            //
                                            //
                                            // );
                                            setState(() {
                                              ss = true;
                                            });
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              //which date will display when user open the picker
                                              firstDate: DateTime(1950),
                                              //what will be the previous supported year in picker
                                              lastDate: DateTime(2300),
                                              builder: (context, child) {
                                                return Theme(
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    colorScheme:
                                                        ColorScheme.light(
                                                      primary:
                                                          Color(0xff666AFF),
                                                      // <-- SEE HERE
                                                      onPrimary: Colors.white,
                                                      // <-- SEE HERE
                                                      onSurface: Colors
                                                          .black, // <-- SEE HERE
                                                    ),
                                                    textButtonTheme:
                                                        TextButtonThemeData(
                                                      style:
                                                          TextButton.styleFrom(
                                                        primary: Color(
                                                            0xff0E47A1), // button text color
                                                      ),
                                                    ),
                                                  ),
                                                  child: child!,
                                                );
                                              },
                                            )
                                                //what will be the up to supported date in picker
                                                .then((pickedDate) {
                                              //then usually do the future job
                                              if (pickedDate == null) {
                                                //if user tap cancel then this function will stop
                                                return;
                                              }
                                              setState(() {
                                                //for rebuilding the ui
                                                selectedDate = pickedDate;
                                                sdataa =
                                                    selectedDate.toString();
                                                sdataa = DateFormat.yMMMd()
                                                    .format(selectedDate);
                                              });
                                              print(selectedDate);
                                              print(sdataa);
                                            });
                                            _pickDateDialog();
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 15, top: 10),
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: context.theme.textTheme
                                                    .headline2?.color,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              'Schedule',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                        )
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 20, top: 5),
                                            height: 40,
                                            width: 130,
                                            child: Text(
                                              '${dataa}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: context.theme.textTheme
                                                      .headline6!.color,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                            //   : Text(
                                            //       '${sdataa}',
                                            // style: TextStyle(
                                            //   fontSize: 15,
                                            //   fontWeight:
                                            //   FontWeight.normal),),
                                            ),
                                        Container(
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  dataa = null;
                                                });
                                              },
                                              icon: Icon(
                                                Icons.close,
                                                color: Colors.red,
                                              )),
                                        )
                                      ],
                                    ),
                              // Row(
                              //   children: [
                              //     ElevatedButton(onPressed: () {
                              //       _pickDateDialog();
                              //     }, child: Text('hh')),
                              //     Text('${DateFormat.yMMMd().format(selectedDate)}')
                              //   ],
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 10, top: 30, bottom: 19),
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color: Color(0xffFC5853),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      // adddata.add(title.text);
                                      // adddata.add(description.text);
                                      // adddata.add(dataa);
                                      // print(adddata);
                                      setState(() {
                                        addmaltipalcollection();
                                      });
                                      print(
                                          '===============>${now.hour}:${now.minute}');
                                      print('title====${title.text}');
                                      print(
                                          'description====${description.text}');
                                      print('dataa===${dataa}');

                                      //  addUser();

                                      // await users.add({
                                      //   'title': '${title.text}',
                                      //   'description': '${description.text}',
                                      //   'date': '${dataa}'
                                      // }).then((value) => print('user added'));

                                      Navigator.pop(context);
                                      title.clear();
                                      description.clear();
                                      setState(() {
                                        dataa = null;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 30, left: 15, bottom: 19),
                                      height: 40,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: context.theme.cardColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  // ElevatedButton(
                                  //     onPressed: () {
                                  //       addmaltipalcollection();
                                  //
                                  //       print('nehil viradiya');
                                  //     },
                                  //     child: Text('sddg'))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              });
        },
        backgroundColor: context.theme.cardColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _widgetOptions.elementAt(_selectedIndex),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Dashbord',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.calendar_today),
      //       label: 'Completed',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Color(0xff8588F4),
      //   onTap: (int index) {
      //     switch (index) {
      //       case 0:
      //         // only scroll to top when current index is selected.
      //         if (_selectedIndex == index) {
      //           _homeController.animateTo(
      //             0.0,
      //             duration: const Duration(milliseconds: 500),
      //             curve: Curves.easeOut,
      //           );
      //         }
      //         break;
      //       case 1:
      //         showModal(context);
      //         break;
      //     }
      //     setState(
      //       () {
      //         _selectedIndex = index;
      //       },
      //     );
      //   },
      // ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.checklist,
              size: 27,
            ),
            label: 'Dashbord',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Completed',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: context.theme.accentColor,
        unselectedItemColor: context.theme.textTheme.headline6!.color,
        onTap: _onItemTapped,
      ),
    );
  }

  void showModal(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Complepage();
      },
    ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
}
