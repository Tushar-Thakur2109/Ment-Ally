import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project1/firebase_options.dart';

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
    // return Container(
    //   color: Color.fromARGB(255, 69, 4, 246),
    // );
    // return Scaffold(
    //   backgroundColor: Colors.blue,
    //   appBar: AppBar(
    //     // backgroundColor: const Color.fromARGB(255, 205, 5, 240),
    //     title: const Text(
    //       "Ment-Ally",
    //       style: TextStyle(color: Color.fromARGB(255, 4, 253, 4)),
    //     ),
    //     centerTitle: true,
    //   ),
    //   body: TextButton(onPressed: () {}, child: const Text('hi')),
    // );
    // return const SplashScreen();

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo2.png',
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        centerTitle: true,
        toolbarHeight: 150,
        // backgroundColor: Color.fromARGB(255, 246, 5, 230),
      ),
      // child: [Center()],
      body: FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
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
                            borderSide:
                                BorderSide(color: Colors.purple, width: 1.0))),
                  ),
                  TextField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: _password,
                    decoration: const InputDecoration(
                        hintText: "Enter your password here."),
                  ),

                  //To grab the value of the text field is to use text controller.

                  TextButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      try {
                        final userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
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

                      //I have handled the above error very well.

                      // );
                      // print(userCredential);
                    },
                    child: const Text("Register"),
                  )
                ],
              );

            default:
              return const Text("Taking my time.....");
          }
        },
      ),
    );
  }
}
