import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Complepage extends StatefulWidget {
  const Complepage({Key? key}) : super(key: key);

  @override
  State<Complepage> createState() => _ComplepageState();
}

class _ComplepageState extends State<Complepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
          children: [
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
                  height: 20,
                  width: 275,
                  child: Text(
                    'Completed',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: context.theme.accentColor,),
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
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 6),
                child: Text(
                  'You have no completed any tasks yet!',
                  style: TextStyle(color: Color(0xffBABABA)),
                ),
              )
            ],
          ),],
      )),
    );
  }
}
