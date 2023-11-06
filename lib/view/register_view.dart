// import 'package:project1/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
        title: const Text("Register Page!"),
      ),
      body: Column(
        children: [
          const Text(
            "Do You Want To Register?",
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
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );

                print(userCredential);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('password is weak need more than 6 symbols.');
                } else {
                  print("some other reason");
                  print(e.runtimeType);
                  print(e.code);
                }
              }
            },
            child: const Text("Register"),
          ),

          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login/', (route) => false);
              },
              child: const Text('Already registered? Login here!')),
        ],
      ),
    );
  }
}
