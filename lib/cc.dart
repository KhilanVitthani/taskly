import 'package:flutter/material.dart';


class Showme extends StatefulWidget {
  const Showme({Key? key}) : super(key: key);

  @override
  State<Showme> createState() => _ShowmeState();
}

class _ShowmeState extends State<Showme> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.grey;
    }
    return Colors.red;
  }

  List<String> hobbyList = [
    'Women',
    'Man',
    'Everyone',
  ];

  List<String>? selectedHobby = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: const Icon(Icons.arrow_back,
                        color: Color(0xff0ffD43496), size: 30)),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 100, left: 70),
                child: Center(
                  child: Text(
                    "Show me",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Wrap(
              children: hobbyList.map(
                    (hobby) {
                  bool isSelected = false;
                  if (selectedHobby!.contains(hobby)) {
                    isSelected = true;
                  }
                  return GestureDetector(
                    onTap: () {
                      if (!selectedHobby!.contains(hobby)) {
                        if (selectedHobby!.length < 1
                        ) {
                          selectedHobby!.add(hobby);
                          setState(() {});
                          print(selectedHobby);
                        }
                      } else {
                        selectedHobby!
                            .removeWhere((element) => element == hobby);
                        setState(() {});
                        print(selectedHobby);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isSelected ? const Color(0xffD43496) : Colors.grey[100],
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                hobby,
                                style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.check_rounded,
                                color:
                                isSelected ? Colors.white : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          const SizedBox(
            height: 160,
          ),
          InkWell(
            onTap: () {

            },
            child: Ink(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xfff953c6), Color(0xffb91d73)],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text("Continue",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15))),
            ),
          ),
        ],
      ),
    );
  }
}