import 'package:flutter/material.dart';
import 'package:orderease_new/navigation_bar.dart';
import 'package:orderease_new/cartPage.dart';
import 'package:orderease_new/screens/signin_screen.dart';
import 'package:orderease_new/screens/welcome_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => WelcomeScreen(),
      'navBar' : (context) => Navigationbar(),
      'signin' : (context) => SignInScreen(),
      "cartPage": (context) => CartPage(),
    },
  ));
}

