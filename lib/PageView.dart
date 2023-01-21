import 'package:flutter/material.dart';

class Pagev extends StatefulWidget {
  const Pagev({Key? key}) : super(key: key);

  @override
  State<Pagev> createState() => _PagevState();
}

class _PagevState extends State<Pagev> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff676AF7),
        onPressed: () {
          // setState(() {
          //   ss=true;
          // });

        },
        child: Icon(Icons.arrow_forward),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 50),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: AssetImage('image/s.jpg'))),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                height: 100,
                width: 390,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Text(
                    //   'Get thing done',
                    //   style: TextStyle(
                    //       color: Color(0xff787AFC),
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 23),
                    // ),
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('image/d.jpeg'),fit: BoxFit.cover)),
              )
            ],
          ),

        ],
      ),
    );
  }
}
