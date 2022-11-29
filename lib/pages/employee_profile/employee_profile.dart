import 'package:breathe/repositories/auth/auth_repository.dart';
import 'package:breathe/repositories/auth/bloc/auth_bloc.dart';
import 'package:breathe/repositories/states/states_repository.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/dropdown.dart';

class EmployeeProfile extends StatefulWidget {
  const EmployeeProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<EmployeeProfile> createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Breathe',
          style: TextStyle(fontSize: 25),
        ),
        leading: Container(
            padding: const EdgeInsets.all(7.0),
            margin: const EdgeInsets.only(left: 5.0),
            child: Image.asset('assets/appbar/harmony.png')),
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
                context.read<AuthBloc>().add(SignOutRequested());
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: FutureBuilder(
          future: StatesRepository().getAverageState(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Hi! ${FirebaseAuth.instance.currentUser!.displayName!}"
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 23, color: Colors.white)),
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
                                    'assets/pop_up/${data.toString().toLowerCase()}.png',
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(data.toString(),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Your average status',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                              SizedBox(height: 15),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'history');
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.transparent,
                                ),
                                child: Text(
                                  'See your history',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text('Need help?',
                              style: TextStyle(color: Colors.grey)),
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
                                icon: Icon(Icons.health_and_safety),
                                iconSize: 30,
                                color: Colors.white,
                              ),
                              Text('Therapist',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.person),
                                iconSize: 30,
                                color: Colors.white,
                              ),
                              Text('Human Resources',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
