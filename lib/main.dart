import 'package:flutter/material.dart';
import 'package:orderease_new/cart_provider.dart';
import 'package:orderease_new/navigation_bar.dart';
import 'package:orderease_new/cartPage.dart';
import 'package:orderease_new/screens/signin_screen.dart';
import 'package:orderease_new/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context){
        return MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => WelcomeScreen(),
      'navBar' : (context) => Navigationbar(),
      'signin' : (context) => SignInScreen(),
       "cartPage": (context) => CartScreen(),
    },
  );
      }
      ),
      );
  }
}