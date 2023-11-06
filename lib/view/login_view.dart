// import 'package:project1/firebase_options.dart';
// import 'register_view.dart';
// import 'package:firebase_core/firebase_core.dart';

// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Column(
        children: [
          const Text(
            "Do You Want To Login?",
            style: TextStyle(fontSize: 20, color: Colors.purple),
          ),
          TextField(
            enableSuggestions: false,
            autocorrect: false,
            controller: _email,
            decoration: const InputDecoration(
                hintText: "Enter your email here.",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 1.0))),
          ),
          TextField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            controller: _password,
            decoration:
                const InputDecoration(hintText: "Enter your password here."),
          ),

          //To grab the value of the text field is to use text controller.

          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;

              try {
                final userCredential =
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email,
                  password: password,
                );

                print(userCredential);
              } on FirebaseAuthException catch (e) {
                print(e.code);
                print(e.runtimeType);
              }
            },
            child: const Text("Login"),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/register/', (route) => false);
              },
              child: const Text(
                  "If you have not registered so far then do it here!!!")),

          TextButton(onPressed: () {}, child: const Text("Notes")),
        ],
      ),
    );
  }
}
