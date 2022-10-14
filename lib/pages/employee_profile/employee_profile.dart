import 'package:breathe/pages/employee_profile/employee_history.dart';
import 'package:breathe/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeProfile extends StatelessWidget {
  const EmployeeProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                builder: (context) => const HomePage()),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Hi! Louis Peterson',
                              style: TextStyle(fontSize: 23)),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/pop_up/great.png',
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Great', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Your average status', style: TextStyle(fontSize: 20)), 
                            SizedBox(height: 15),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const EmployeeHistory()),
                                );
                              
                              },
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.transparent,
                                
                              ),
                              child: Text(
                                'See your history',
                                style: TextStyle(
                                    decoration: TextDecoration.underline, fontSize: 15),
                              ),
                            ),
                          
                          ],
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 20),


                    Row(
                      children: [
                        Text('Need help?', style: TextStyle( color: Colors.grey)),
                      ],
                    ),

                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.person),
                              iconSize: 30,
                              color: Colors.white,
                            ),
                            Text('Therapist', style: TextStyle(color: Colors.white)),
                          ],
                        ),

                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.phone),
                              iconSize: 30,
                              color: Colors.white,
                            ),
                            Text('Human Resources', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
