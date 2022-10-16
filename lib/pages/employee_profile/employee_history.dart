import 'package:breathe/pages/employee_profile/employee_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/dropdown.dart';

class EmployeeHistory extends StatelessWidget {
  const EmployeeHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map> dummyItems = List.generate(
            20, (index) => {"status": 'Great', "date": "Monday 09/12/2022  "})
        .toList();

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Color.fromARGB(255, 21, 21, 21),
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Breathe',
              style: TextStyle(fontSize: 25),
            ),
            leading: Container(
              padding: const EdgeInsets.all(7.0),
              margin: const EdgeInsets.only(left: 5.0),
              child: Image.asset('assets/appbar/harmony.png'),
            ),
            toolbarHeight: 70,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              DropDown()
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EmployeeProfile()),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.transparent,
                        ),
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 15,
                        ),
                        label: Text(
                          'Go back to feed',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Your status history.',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: dummyItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: //image with white background
                          Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.asset('assets/pop_up/great.png',),
                        ),
                      ),
                      title: Text(dummyItems[index]['status']),
                      subtitle: Text(dummyItems[index]['date']),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
