// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project1/view/register_view.dart';

// import 'view/login_view.dart';
// import 'view/register_view.dart';

// import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:splashscreen/splashscreen.dart';
// import 'dart:async';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      // appBarTheme: const AppBarTheme(backgroundColor: Colors.yellow)
    ),
    // home: const SplashScreen(
    //     backgroundColor: Colors.white,
    //     image: 'assets/image2-transformed.jpeg',
    //     duration: 30000),
    home: const RegisterView(),
  ));
}

//Some information that I want to add is that because the SplashScreen is not working so
//for now I am just adding what is running for now.

//This is the code that has been removed.

//Also I will align the app too.

//  Stack(
//         children: [
//           SplashScreen(
//             image: 'assets/logo.png',
//             duration: 3,
//             backgroundColor: Color.fromARGB(255, 174, 33, 33),
//           ),
//           Center(child: Text('why')),
//         ],
//       ),
//Here I removed the boilerplate Homepage code and now I am going to make my ownclass of homepage.

//Here we are creating a stateful register widget

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const HomePage();
//   }
// }

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
    required this.image,
    required this.backgroundColor,
    required this.duration,
    // this.onWillPop,
  }) : super(key: key);

  final String image;
  final Color? backgroundColor;
  final int duration;
  // final VoidCallback? onWillPop;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // body: const Center(
        // child: Image.asset(image),
        //  text : Text("hello"),
        // ),
        // backgroundColor: Colors.red,
        );
  }
}

// class Scaffold extends StatelessWidget {
//   const Scaffold({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const ;
//   }
// }

//Here I am adding a dedicated homepage.
//The purpose of this code is to add the home page to go to the login and register page on the basis of
// the error encountered.

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              final user = FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                //After understanding the use of debug console I am commenting out the print().
                // print("Your are a verified user");
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VerifyEmailView()));
                return const Text("The process has completed.");
              }

            //As much as I know right now this tells whether the
            // connection has established or not but I need to check out more.

            default:
              return const Text("Taking my time.....");
          }

          return const Scaffold();
        },
      ),
    );
  }
}

//Here I want to create a email verification widget.

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Email.")),
    );
  }
}
