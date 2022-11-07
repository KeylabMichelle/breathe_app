import 'package:breathe/pages/sign_in/sign_in.dart';
import 'package:breathe/repositories/auth/auth_repository.dart';
import 'package:breathe/repositories/auth/bloc/auth_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pop_up/pop_up.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool passwordObscure = true;
  bool passwordObscure2 = true;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context)),
        child: MaterialApp(
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
                //outlined button
                Container(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                  margin: const EdgeInsets.only(right: 15.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignIn()),
                            );
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 12),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side:
                                const BorderSide(color: Colors.white, width: 1),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is Authenticated) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PopUp()),
                  );
                }
                if (state is AuthError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                if (state is Loading) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
                }
                if (state is UnAuthenticated) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  'Welcome, sign up.',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),

                          /* First name */

                          Padding(
                            padding:
                                const EdgeInsets.only(top: 40.0, bottom: 15),
                            child: TextField(
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(141, 255, 255, 255),
                                    fontSize: 14),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),

                          /* Last name */

                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextField(
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(141, 255, 255, 255),
                                    fontSize: 14),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),

                          /* Email */

                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(141, 255, 255, 255),
                                    fontSize: 14),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),

                          /* Password */

                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: passwordObscure,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(141, 255, 255, 255),
                                    fontSize: 14),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passwordObscure = !passwordObscure;
                                    });
                                  },
                                  icon: passwordObscure
                                      ? const Icon(Icons.visibility_outlined)
                                      : const Icon(
                                          Icons.visibility_off_outlined),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          /* Confirm password */

                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextField(
                              controller: _passwordController2,
                              obscureText: passwordObscure2,
                              decoration: InputDecoration(
                                labelText: 'Confirm password',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(141, 255, 255, 255),
                                    fontSize: 14),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passwordObscure2 = !passwordObscure2;
                                    });
                                  },
                                  icon: passwordObscure2
                                      ? const Icon(Icons.visibility_outlined)
                                      : const Icon(
                                          Icons.visibility_off_outlined),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, left: 50, right: 50),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_firstNameController.text.isEmpty ||
                                          _lastNameController.text.isEmpty ||
                                          _emailController.text.isEmpty ||
                                          _passwordController.text.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Please fill all the fields')));
                                      } else if (_passwordController.text !=
                                          _passwordController2.text) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Passwords do not match')));
                                      } else {
                                        BlocProvider.of<AuthBloc>(context).add(
                                          SignUpRequested(
                                              _emailController.text,
                                              _passwordController.text,
                                              _firstNameController.text,
                                              _lastNameController.text),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.black,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
