import 'package:flutter/material.dart';
import 'package:orderease_new/Carousel_Slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orderease_new/popular.dart';
import 'package:orderease_new/NewItem.dart';



class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          // SizedBox(height: 20), // Adding space between the search bar and carousel slider
          MyCarouselSlider(),
          Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                "Popular",
                style: GoogleFonts.acme(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
             ),
             
             PopularItemPage(),

             //ITEMS
             Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                "Recommended items",
                style: GoogleFonts.acme(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
             ),

             NewestItemsPage(),
        ],
      ),

      // //cart
      // floatingActionButton: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(20),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.grey.withOpacity(0.5),
      //         spreadRadius: 2,
      //         blurRadius: 10,
      //         offset: Offset(0,3),
      //       )
      //     ]
      //   ),
      //   child: FloatingActionButton(
      //     onPressed: (){
      //     Navigator.pushNamed(context, "cartPage");
      //   },
      //    child: Padding(
      //      padding: const EdgeInsets.all(0),
      //      child: Icon(
      //       Icons.shopping_cart_checkout_outlined,size:28,color: Colors.red,
      //       ),
      //    ),
      //     backgroundColor: Colors.white,
      //   ),
      //   ),
    );
  }
}
