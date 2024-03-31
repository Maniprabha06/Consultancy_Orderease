import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key});

  final List<Map<String, dynamic>> items = [
    {
      "imagePath": "assets/tandoori.jpg",
      "title": "Tandoori",
      "description": "Taste our Chicken Tandoori",
      "price": "\₹125",
    },
    {
      "imagePath": "assets/chicken wings.jpg",
      "title": "Chicken wings",
      "description": "Taste our Famous Chicken wings",
      "price": "\₹85",
    },
    {
      "imagePath": "assets/grill.jpg",
      "title": "Grill Chicken",
      "description": "Taste our Famous Grill chicken",
      "price": "\₹45",
    },
    {
      "imagePath": "assets/lollipop.jpg",
      "title": "Chicken Lollipop",
      "description": "Taste our Famous Lollipop",
      "price": "\₹75",
    },
    {
      "imagePath": "assets/chicken-hyderabadi-biryani-01.jpg",
      "title": "Chicken Biryani",
      "description": "Taste our Famous Chicken Briyani",
      "price": "\₹100",
    },
    {
      "imagePath": "assets/img2.jpg",
      "title": "Kari Dosai",
      "description": "Taste our Famous Kai Dosai",
      "price": "\₹55",
    },
    {
      "imagePath": "assets/fish_fry.jpg",
      "title": "Fish Fry",
      "description": "Taste our Famous Fish Fry",
      "price": "\₹50",
    },
    {
      "imagePath": "assets/mutta_veech.jpg",
      "title": "Egg Veech",
      "description": "Try our Famous Egg Veech",
      "price": "\₹45",
    },
    {
      "imagePath": "assets/dragon_chicken.jpg",
      "title": "Dragon Chicken",
      "description": "Try our Famous Dragon Chicken",
      "price": "\₹45",
    },
    {
      "imagePath": "assets/dosai.jpg",
      "title": "Dosai",
      "description": "Try our Famous Dosai",
      "price": "\₹30",
    },
    {
      "imagePath": "assets/idly.jpg",
      "title": "Idly",
      "description": "Try our Famous Idly",
      "price": "\₹15",
    },
    {
      "imagePath": "assets/mutta_parotta.jpg",
      "title": "Egg Parotta",
      "description": "Try our Famous Egg Parotta",
      "price": "\₹30",
    },
    {
      "imagePath": "assets/mutton_gravy.jpg",
      "title": "Mutton Gravy",
      "description": "Try our Famous Mutton Gravy",
      "price": "\₹145",
    },
    {
      "imagePath": "assets/pongal.jpeg",
      "title": "Pongal",
      "description": "Taste our Famous Pongal",
      "price": "\₹55",
    },
    {
      "imagePath": "assets/veechu.jpg",
      "title": "Veech",
      "description": "Taste our Famous Veech",
      "price": "\₹145",
    },
    {
      "imagePath": "assets/img5.jpg",
      "title": "Mutton Briyani",
      "description": "Taste our Mutton Briyani",
      "price": "\₹90",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Container(
              height: 50,
              width: 480,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search here...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.filter_list),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: items.map((item) {
                      return buildItem(context, item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build each item widget
  Widget buildItem(BuildContext context, Map<String, dynamic> itemData) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  itemData["imagePath"],
                  height: 120,
                  width: 260,
                ),
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
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Row(
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
                  Padding(
                    padding: const EdgeInsets.only(right: 28.0),
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        alignment: Alignment.center,
                        onPressed: () {},
                        icon: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Icon(
                            Icons.shopping_cart_checkout_outlined,
                            color: Colors.red,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
