import 'package:breathe/pages/sign_in/sign_in.dart';
import 'package:breathe/pages/sign_up/sign_up.dart';
import 'package:breathe/pages/pop_up/pop_up.dart';
import 'package:breathe/pages/home/home_page.dart';
import 'package:breathe/pages/employee_profile/employee_profile.dart';
import 'package:breathe/pages/employee_profile/employee_history.dart';
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: "pages/employee_profile/employee_profile",

      routes: {
        "pages/sign_in/sign_in": (context) =>  SignIn(),
        "pages/sign_up/sign_up": (context) =>  SignUp(),
        "pages/pop_up/pop_up": (context) =>    PopUp(),
        "pages/home/home_page": (context) =>   HomePage(),
        "pages/employee_profile/employee_history": (context) =>   EmployeeHistory(),
        "pages/employee_profile/employee_profile": (context) =>   EmployeeProfile(),
        
      },
    );
  }
}
