import 'package:flutter/material.dart';
import 'package:orderease_new/navigation_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:10,),

              child: Column(
                children: [
                  Navigationbar(),
                  Padding(padding: EdgeInsets.only(
                    top:20,
                    left:10,
                    bottom:10,
                  ),
                  child: Text("Order list"),
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}