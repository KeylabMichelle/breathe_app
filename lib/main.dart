import 'package:breathe/pages/employee_profile/employee_history.dart';
import 'package:breathe/pages/employee_profile/employee_profile.dart';
import 'package:breathe/pages/enterprise_stats/enterprise_stats.dart';
import 'package:breathe/pages/home/home_page.dart';
import 'package:breathe/pages/sign_in/sign_in.dart';
import 'package:breathe/pages/sign_up/sign_up.dart';
import 'package:breathe/pages/upload_pic/upload_photo.dart';
import 'package:breathe/repositories/auth/auth_repository.dart';

import 'package:breathe/pages/pop_up/pop_up.dart';

import 'package:breathe/repositories/auth/bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
//import states_repository.dart
import 'package:breathe/repositories/states/states_repository.dart';

bool state = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async =>
      {state = await StatesRepository().checkState(DateTime.now())});
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(authRepository: AuthRepository()),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(authRepository: AuthRepository()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Color.fromARGB(255, 21, 21, 21),
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
          routes: {
            'profile': (context) => EmployeeProfile(),
            'stats': (context) => EnterpriseStats(),
            'upload_photo': (context) => UploadPhoto(),
            'history': (context) => EmployeeHistory(),
            'pop_up': (context) => PopUp(),
            'home': (context) => HomePage(),
            'sign_up': (context) => SignUp(),
            'sign_in': (context) => SignIn(),
          },
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              print(state);
              if (snapshot.hasData && !state) {
                return const PopUp();
              } else if (snapshot.hasData && state) {
                return const HomePage();
              } else {
                return const SignIn();
              }
            },
          ),
        ),
      ),
    );
  }
}
