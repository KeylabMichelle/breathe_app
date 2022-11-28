import 'package:breathe/pages/components/dropdown.dart';
import 'package:breathe/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterpriseStats extends StatefulWidget {
  const EnterpriseStats({
    Key? key,
  }) : super(key: key);

  @override
  State<EnterpriseStats> createState() => _EnterpriseStatsState();
}

class _EnterpriseStatsState extends State<EnterpriseStats> {
  @override
  Widget build(BuildContext context) {
    List<Map> dummyItems = [
      {"stat": "Great", "image": 'assets/pop_up/great.png', "percent": 10},
      {"stat": "Fine", "image": 'assets/pop_up/fine.png', "percent": 80},
      {"stat": "Meh", "image": 'assets/pop_up/meh.png', "percent": 10},
      {"stat": "Bad", "image": 'assets/pop_up/bad.png', "percent": 0},
    ];

    return Scaffold(
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
        actions: [DropDown()],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, 'home');
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
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Statistics.', style: TextStyle(fontSize: 23)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              'assets/pop_up/fine.png',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Fine', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Average status.', style: TextStyle(fontSize: 20)),
                        SizedBox(height: 15),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            'Fine, looking healthy! But be careful',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text('All', style: TextStyle(fontSize: 20)),
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
                        dummyItems[index]["image"],
                      ),
                    ),
                  ),
                  title: Text(dummyItems[index]['stat']),
                  subtitle: Text(dummyItems[index]['percent'].toString() + '%'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
