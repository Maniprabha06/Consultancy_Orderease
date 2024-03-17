// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularItemPage extends StatelessWidget {
  const PopularItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
          child: Row(children: [
            //for(int i=0;i<10;i++)
            //single item
            Padding(padding: EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              width: 170,
              height: 225,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0,3),
                  )
                ]
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/mutton_briyani.jpg",
                        height: 130,
                      ),
                    ),
                   Text(
                    "Mutton Briyani",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Taste our Mutton Briyani",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₹90",style: TextStyle(
                         fontSize: 17,
                         color: Colors.red,
                         fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(
                          width: 30, // Adjust the width as needed
                          height: 30, // Adjust the height as needed
                          child: IconButton(
                            alignment: Alignment.center,
                            onPressed: () {
                              // Add your onPressed function here
                            },
                            icon: Icon(
                              Icons.shopping_cart_checkout_outlined,
                              color: Colors.red,
                              size: 18,
                            ),
                          ),
                        )

                    ],
                  )
                  ],
                ),
              ),
            ),
            ),

             Padding(padding: EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              width: 170,
              height: 230,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0,3),
                  )
                ]
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/tandoori.jpg",
                        height: 120,
                        width: 150,
                         //height: 130,
                      ),
                    ),
                   Text(
                    "Tandoori",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Taste our Chicken Tandoori",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₹125",style: TextStyle(
                         fontSize: 17,
                         color: Colors.red,
                         fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(
                          width: 30, // Adjust the width as needed
                          height: 30, // Adjust the height as needed
                          child: IconButton(
                            alignment: Alignment.center,
                            onPressed: () {
                              // Add your onPressed function here
                            },
                            icon: Icon(
                              Icons.shopping_cart_checkout_outlined,
                              color: Colors.red,
                              size: 18,
                            ),
                          ),
                        )

                    ],
                  )
                  ],
                ),
              ),
            ),
            ),


             Padding(padding: EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              width: 170,
              height: 225,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0,3),
                  )
                ]
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/chicken_wings.jpg",
                        height: 130,
                      ),
                    ),
                   Text(
                    "Chicken wings",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Taste our Famous Chinken_wings",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₹85",style: TextStyle(
                         fontSize: 17,
                         color: Colors.red,
                         fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(
                          width: 30, // Adjust the width as needed
                          height: 30, // Adjust the height as needed
                          child: IconButton(
                            alignment: Alignment.center,
                            onPressed: () {
                              // Add your onPressed function here
                            },
                            icon: Icon(
                              Icons.shopping_cart_checkout_outlined,
                              color: Colors.red,
                              size: 18,
                            ),
                          ),
                        )

                    ],
                  )
                  ],
                ),
              ),
            ),
            ),


             Padding(padding: EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              width: 170,
              height: 230,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0,3),
                  )
                ]
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/kari_dosai.jpg",
                        height: 130,
                      ),
                    ),
                   Text(
                    "Kari Dosa",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Taste our Famous Kari Dosa",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₹45",style: TextStyle(
                         fontSize: 17,
                         color: Colors.red,
                         fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(
                          width: 30, // Adjust the width as needed
                          height: 30, // Adjust the height as needed
                          child: IconButton(
                            alignment: Alignment.center,
                            onPressed: () {
                              // Add your onPressed function here
                            },
                            icon: Icon(
                              Icons.shopping_cart_checkout_outlined,
                              color: Colors.red,
                              size: 18,
                            ),
                          ),
                        )

                    ],
                  )
                  ],
                ),
              ),
            ),
            ),


             Padding(padding: EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              width: 170,
              height: 225,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0,3),
                  )
                ]
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/lollipop.jpg",
                        height: 130,
                      ),
                    ),
                   Text(
                    "Chicken Lollipop",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Taste our Famous lollipop",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₹75",style: TextStyle(
                         fontSize: 17,
                         color: Colors.red,
                         fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(
                          width: 30, // Adjust the width as needed
                          height: 30, // Adjust the height as needed
                          child: IconButton(
                            alignment: Alignment.center,
                            onPressed: () {
                              // Add your onPressed function here
                            },
                            icon: Icon(
                              Icons.shopping_cart_checkout_outlined,
                              color: Colors.red,
                              size: 18,
                            ),
                          ),
                        )

                    ],
                  )
                  ],
                ),
              ),
            ),
            ),


             Padding(padding: EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              width: 170,
              height: 225,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0,3),
                  )
                ]
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/chicken-hyderabadi-briyani-01.jpg",
                        height: 130,
                      ),
                    ),
                   Text(
                    "Chicken Briyani",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Taste or Famous Chciken Briyani",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₹100",style: TextStyle(
                         fontSize: 17,
                         color: Colors.red,
                         fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(
                          width: 30, // Adjust the width as needed
                          height: 30, // Adjust the height as needed
                          child: IconButton(
                            alignment: Alignment.center,
                            onPressed: () {
                              // Add your onPressed function here
                            },
                            icon: Icon(
                              Icons.shopping_cart_checkout_outlined,
                              color: Colors.red,
                              size: 18,
                            ),
                          ),
                        )

                    ],
                  )
                  ],
                ),
              ),
            ),
            ),
              
          ],
          )
          ),
    );
  }
}