import 'package:breathe/pages/employee_profile/employee_profile.dart';
import 'package:breathe/repositories/states/states_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/dropdown.dart';
//import datetime
import 'package:intl/intl.dart';

class EmployeeHistory extends StatefulWidget {
  const EmployeeHistory({
    Key? key,
  }) : super(key: key);

  @override
  State<EmployeeHistory> createState() => _EmployeeHistoryState();
}

class _EmployeeHistoryState extends State<EmployeeHistory> {
  @override
  Widget build(BuildContext context) {
    final List<Map> dummyItems = List.generate(
            20, (index) => {"status": 'Great', "date": "Monday 09/12/2022  "})
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Breathe',
          style: TextStyle(fontSize: 25),
        ),
        leading: BackButton(color: Colors.white),
        /* Container(
          padding: const EdgeInsets.all(7.0),
          margin: const EdgeInsets.only(left: 5.0),
          child: Image.asset('assets/appbar/harmony.png'),
        ), */
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [],
      ),
      body: Column(
        children: [
          /*  Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "profile");
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
                      style: TextStyle(decoration: TextDecoration.underline),
                    )),
              ],
            ),
          ), */
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Your status history.',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: FutureBuilder(
              future: StatesRepository().getStateHistory(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  var data = snapshot.data as List<dynamic>;

                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      print("Daaate ${data[index]['date']}");
                      var dt = (data[index]['date'] as Timestamp).toDate();

                      return ListTile(
                        leading: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Image.asset(
                              {
                                'great': 'assets/pop_up/great.png',
                                'fine': 'assets/pop_up/fine.png',
                                'meh': 'assets/pop_up/meh.png',
                                'bad': 'assets/pop_up/bad.png',
                              }[data[index]['state']]!,
                            ),
                          ),
                        ),
                        title: Text(
                          {
                            'great': 'Great',
                            'fine': 'Fine',
                            'meh': 'Meh',
                            'bad': 'Bad',
                          }[data[index]['state']]!,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          DateFormat('EEEE, MMMM d, yyyy').format(dt),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
/* 
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
                        child: Image.asset(
                          'assets/pop_up/great.png',
                        ),
                      ),
                    ),
                    title: Text(dummyItems[index]['status']),
                    subtitle: Text(dummyItems[index]['date']),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 */
