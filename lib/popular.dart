import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularItemPage extends StatelessWidget {
   PopularItemPage({Key? key}) : super(key: key);

  // Define a list of item data
  final List<Map<String, dynamic>> items = [
    {
      "imagePath": "assets/mutton_biriyani.jpg",
      "title": "Mutton Briyani",
      "description": "Taste our Mutton Briyani",
      "price": "\₹250",
    },
    {
      "imagePath": "assets/tandoori.jpg",
      "title": "Tandoori",
      "description": "Taste our Chicken Tandoori",
      "price": "\₹150",
    },
    {
      "imagePath": "assets/chicken wings.jpg",
      "title": "Chicken wings",
      "description": "Taste our Famous Chicken wings",
      "price": "\₹180",
    },
    {
      "imagePath": "assets/kari_dosai.jpg",
      "title": "Kari Dosa",
      "description": "Taste our Famous Kari Dosa",
      "price": "\₹130",
    },
    {
      "imagePath": "assets/lollipop.jpg",
      "title": "Chicken Lollipop",
      "description": "Taste our Famous Lollipop",
      "price": "\₹100",
    },
    {
      "imagePath": "assets/chicken-hyderabadi-biryani-01.jpg",
      "title": "Chicken Biryani",
      "description": "Taste our Famous Chicken Briyani",
      "price": "\₹150",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: items.map((item) {
            return buildItem(item);
          }).toList(),
        ),
      ),
    );
  }

  // Function to build each item widget
  Widget buildItem(Map<String, dynamic> itemData) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7),
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
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  itemData["imagePath"],
                  height: 120,
                  width: 150,
                ),
              ),
              Text(
                itemData["title"],
                style: GoogleFonts.acme(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 2),
              Text(
                itemData["description"],
                style: GoogleFonts.acme(
                  textStyle: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itemData["price"],
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: IconButton(
                      alignment: Alignment.center,
                      onPressed: () {
 
                      },
                      icon: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
