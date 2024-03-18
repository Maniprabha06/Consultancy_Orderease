import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class NewestItemsPage extends StatelessWidget {
  const NewestItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
  child: Padding(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        //for(int i=0;i<6;i++)
        //single item
        Padding(
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Container(
            width: double.infinity, // Adjusted to use available width
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/veechu.jpg",
                        height: 120,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Added space between image and text
                Container(
                  width: MediaQuery.of(context).size.width - 190 - 40, // Adjusted width considering the image width and additional spacing
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Veech Parotta",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Taste our  veech parotta,\nIt will become your \nfavourite",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

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
                
              ],
            ),
          ),
        ),


         //single item
        Padding(
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Container(
            width: double.infinity, // Adjusted to use available width
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/dosai.jpg",
                        height: 120,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Added space between image and text
                Container(
                  width: MediaQuery.of(context).size.width - 190 - 40, // Adjusted width considering the image width and additional spacing
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Dosa",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Taste our Dosa,\nIt will become your \nfavourite",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₹35",style: TextStyle(
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
                
              ],
            ),
          ),
        ),


         //single item
        Padding(
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Container(
            width: double.infinity, // Adjusted to use available width
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/mutta_parotta.jpg",
                        height: 120,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Added space between image and text
                Container(
                  width: MediaQuery.of(context).size.width - 190 - 40, // Adjusted width considering the image width and additional spacing
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Mutta Parotta",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Taste our mutta parotta,\nIt will become your \nfavourite",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₹55",style: TextStyle(
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
                
              ],
            ),
          ),
        ),

         //single item
        Padding(
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Container(
            width: double.infinity, // Adjusted to use available width
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/idly.jpg",
                        height: 120,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Added space between image and text
                Container(
                  width: MediaQuery.of(context).size.width - 190 - 40, // Adjusted width considering the image width and additional spacing
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Idly",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Taste our Idly,\nIt will become your \nfavourite",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₹15",style: TextStyle(
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
                
              ],
            ),
          ),
        ),

         //single item
        Padding(
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Container(
            width: double.infinity, // Adjusted to use available width
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/grill.jpg",
                        height: 120,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Added space between image and text
                Container(
                  width: MediaQuery.of(context).size.width - 190 - 40, // Adjusted width considering the image width and additional spacing
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Grill Chicken",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Taste our Grill chicken,\nIt will become your \nfavourite",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₹150",style: TextStyle(
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
                
              ],
            ),
          ),
        ),


         //single item
        Padding(
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Container(
            width: double.infinity, // Adjusted to use available width
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/pongal.jpeg",
                        height: 120,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Added space between image and text
                Container(
                  width: MediaQuery.of(context).size.width - 190 - 40, // Adjusted width considering the image width and additional spacing
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Pongal",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Taste our pongal,\nIt will become your \nfavourite",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₹65",style: TextStyle(
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
                
              ],
            ),
          ),
        ),

         //single item
        Padding(
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Container(
            width: double.infinity, // Adjusted to use available width
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/fish_fry.jpg",
                        height: 120,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Added space between image and text
                Container(
                  width: MediaQuery.of(context).size.width - 190 - 40, // Adjusted width considering the image width and additional spacing
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Fish Fry",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Taste our Fish Fry,\nIt will become your \nfavourite",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

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
                
              ],
            ),
          ),
        ),


         //single item
        Padding(
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Container(
            width: double.infinity, // Adjusted to use available width
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/dragon_chicken.jpg",
                        height: 120,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Added space between image and text
                Container(
                  width: MediaQuery.of(context).size.width - 190 - 40, // Adjusted width considering the image width and additional spacing
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Dragon Chicken",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Taste our Dragon Chciken,\nIt will become your \nfavourite",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₹150",style: TextStyle(
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
                
              ],
            ),
          ),
        ),


         //single item
        Padding(
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Container(
            width: double.infinity, // Adjusted to use available width
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/mutta_veech.jpg",
                        height: 120,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Added space between image and text
                Container(
                  width: MediaQuery.of(context).size.width - 190 - 40, // Adjusted width considering the image width and additional spacing
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Egg veech",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Taste our Egg veech,\nIt will become your \nfavourite",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

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
                
              ],
            ),
          ),
        ),



         //single item
        Padding(
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Container(
            width: double.infinity, // Adjusted to use available width
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/mutton_gravy.jpg",
                        height: 120,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Added space between image and text
                Container(
                  width: MediaQuery.of(context).size.width - 190 - 40, // Adjusted width considering the image width and additional spacing
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Mutton Gravy",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Taste our Mutton gravy,\nIt will become your \nfavourite",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₹95",style: TextStyle(
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
                
              ],
            ),
          ),
        ),


         //single item
        Padding(
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Container(
            width: double.infinity, // Adjusted to use available width
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/img4.jpg",
                        height: 120,
                        width: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Added space between image and text
                Container(
                  width: MediaQuery.of(context).size.width - 190 - 40, // Adjusted width considering the image width and additional spacing
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Parotta",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Taste our parotta,\nIt will become your \nfavourite",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\₹25",style: TextStyle(
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
                
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

  }
}