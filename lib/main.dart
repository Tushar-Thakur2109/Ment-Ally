// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:project1/view/register_view.dart';
// import 'view/login_view.dart';
// import 'view/register_view.dart';
// import 'package:splashscreen/splashscreen.dart';
// import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';

// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project1/view/login_view.dart';
import 'package:project1/view/notes_view.dart';
import 'package:project1/view/register_view.dart';
import 'package:project1/view/verify_email_view.dart';
import 'firebase_options.dart';

void main() {
  //No indepth understanding of the below piece of code is available but will find it for sure.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(104, 24, 137, 25)),
      useMaterial3: true,
    ),

    home: const RegisterView(),

    //To create routes

    routes: {
      '/login/': (context) => const LoginView(),
      '/register/': (context) => const RegisterView(),
      '/notesRoute/': (context) => const NotesView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;

              print("The code has run upto here");
              if (user != null) {
                print("Some issue is occuring here .");

                if (user.emailVerified) {
                  print("Code has reached upto this point");
                  return const NotesView();
                }
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VerifyEmailView()));
                return const Text("The process has completed.");
              }

              return const LoginView();
            default:
              return const CircularProgressIndicator(
                strokeWidth: 1.0,
              );
          }
        });
  }
}
