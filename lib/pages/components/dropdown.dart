import 'package:breathe/pages/employee_profile/employee_profile.dart';
import 'package:breathe/pages/enterprise_stats/enterprise_stats.dart';
import 'package:breathe/repositories/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/home_page.dart';

const List<String> list = <String>['Home', 'Stats', 'Profile', 'Log out'];

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DropdownButton<String>(
        value: dropdownValue,
        hint: Text('Menu'),
        icon: const Icon(Icons.arrow_drop_down_outlined),
        style: const TextStyle(color: Colors.white),
        underline: Container(
          height: 2,
          color: Colors.transparent,
        ),
        dropdownColor: Color.fromARGB(255, 21, 21, 21),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
            if (dropdownValue == 'Home') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            } else if (dropdownValue == 'Log out') {
              context.read<AuthBloc>().add(SignOutRequested());
            } else if (dropdownValue == 'Stats') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EnterpriseStats()),
              );
            } else if (dropdownValue == 'Profile') {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EmployeeProfile()),
              );
            }
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
