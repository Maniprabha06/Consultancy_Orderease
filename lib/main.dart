import 'package:flutter/material.dart';
import 'package:orderease_new/navigation_bar.dart';
import 'package:orderease_new/cartPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Navigationbar(),
      "cartPage": (context) => CartPage(),
    },
  ));
}

