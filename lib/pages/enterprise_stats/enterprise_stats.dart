import 'package:breathe/pages/components/dropdown.dart';
import 'package:breathe/pages/home/home_page.dart';
import 'package:breathe/repositories/states/states_repository.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
              icon: const Icon(Icons.home)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'profile');
              },
              icon: const Icon(Icons.person)),
        ],
      ),
      body: FutureBuilder(
          future: StatesRepository().getAverageStateForAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data as Map;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Statistics.',
                                style: TextStyle(
                                    fontSize: 23, color: Colors.white)),
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
                                      'assets/pop_up/${data["average"].toString().toLowerCase()}.png',
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(data['average'].toString(),
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white)),
                              ],
                            ),
                            Column(
                              children: [
                                Text('Average status.',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                                SizedBox(height: 15),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    'Fine, looking healthy! But be careful',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text('All',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListTile(
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
                          'assets/pop_up/great.png',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text('Great',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    subtitle: Text(data['great'].toString() + '%',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
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
                          'assets/pop_up/fine.png',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text('Fine',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    subtitle: Text(data['fine'].toString() + '%',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
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
                          'assets/pop_up/meh.png',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text('Meh',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    subtitle: Text(data['meh'].toString() + '%',
                        style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
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
                          'assets/pop_up/bad.png',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text('Bad',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    subtitle: Text(data['bad'].toString() + '%',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
