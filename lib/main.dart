import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:orderease_new/firebase_options.dart';
import 'package:orderease_new/navigation_bar.dart';
import 'package:orderease_new/cartPage.dart';
import 'package:orderease_new/screens/signin_screen.dart';
import 'package:orderease_new/screens/welcome_screen.dart';
import 'package:orderease_new/ProfilePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => WelcomeScreen(), // Route for the welcome screen
        'navBar': (context) => Navigationbar(), // Route for the navigation bar screen
        'signin': (context) => SignInScreen(), // Route for the sign-in screen
        //'cartPage': (context) => CartPage(), // Route for the cart page
        'profilePage': (context) => ProfilePage(),
      },
    );
  }
}
