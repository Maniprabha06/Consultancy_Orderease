import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:orderease_new/HomePage.dart';
import 'package:orderease_new/navigation_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: Text(
              'My_Cart_Page',
              style: GoogleFonts.acme( // Example: Using Open Sans font
                fontSize: 20.0,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.account_circle_sharp,
              ),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.pink,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
              MaterialPageRoute(
              builder: (context) => Navigationbar(),
      ),
    );
            },
            icon: const Icon(Icons.arrow_back,
            
            ),
          ),
        ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:10,),

              child: Column(
                children: [
                  
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