import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class EmployeeHistory extends StatelessWidget {
  const EmployeeHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}