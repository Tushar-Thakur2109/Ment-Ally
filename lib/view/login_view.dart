import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project1/firebase_options.dart';
// import 'register_view.dart';
//Description of this part of code

//This code is for the login page that is for someone who has already approached the app.

//The other portion is that o
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
                            .signInWithEmailAndPassword(
                          email: email,
                          password: password,

                          //In my case instead of specific issues like username not found and password is wrong or
                          // to short this is not working so right now I am handling them considering that they
                          // come under the category of the Invalid User Credentials.
                        );

                        print(userCredential);
                      } on FirebaseAuthException catch (e) {
                        // if(e.code ==)

                        print(e.code);
                        print(e.runtimeType);
                        // if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
                        //   print("invalid user credentials");
                        // }
                        // else if (e.code == 'INVALID_LOGIN_CREDENTIALS')

                        //The above line of code might not be useful becuase the error that you are getting is
                        //invalid user credentials and not invalid user name or password.

                        //Checkout the other version too.
                      }

                      // (
                      // email: email,
                      // password: password,
                    },
                    child: const Text("Login"),
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
