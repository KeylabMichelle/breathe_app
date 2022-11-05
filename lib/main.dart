import 'package:breathe/pages/enterprise_stats/enterprise_stats.dart';
import 'package:breathe/pages/sign_in/sign_in.dart';
import 'package:breathe/pages/sign_up/auth_repository.dart';
import 'package:breathe/pages/sign_up/bloc/auth_bloc.dart';
import 'package:breathe/pages/sign_up/sign_up.dart';
import 'package:breathe/pages/pop_up/pop_up.dart';
import 'package:breathe/pages/home/home_page.dart';
import 'package:breathe/pages/employee_profile/employee_profile.dart';
import 'package:breathe/pages/employee_profile/employee_history.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const PopUp();
              }
              return SignIn();
            },
          ),
        ),
      ),
    );
  }
}
