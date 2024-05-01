import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewestItemsPage extends StatelessWidget {
  const NewestItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a list of item data
    final List<Map<String, dynamic>> items = [
      {
        'image': 'assets/veechu.jpg',
        'title': 'Veech Parotta',
        'description': 'Taste our veech parotta,\nIt will become your favourite',
        'price': '\₹30',
      },
      {
        'image': 'assets/dosai.jpg',
        'title': 'Dosa',
        'description': 'Taste our Dosa,\nIt will become your favourite',
        'price': '\₹20',
      },
      {
        'image': 'assets/mutta_parotta.jpg',
        'title': 'Mutta Parotta',
        'description': 'Taste our mutta parotta,\nIt will become your favourite',
        'price': '\₹70',
      },
      {
        'image': 'assets/idly.jpg',
        'title': 'Idly',
        'description': 'Taste our Idly,\nIt will become your favourite',
        'price': '\₹20',
      },
      {
        'image': 'assets/grill.jpg',
        'title': 'Grill Chicken',
        'description': 'Taste our Grill chicken,\nIt will become your favourite',
        'price': '\₹150',
      },
      {
        'image': 'assets/pongal.jpeg',
        'title': 'Pongal',
        'description': 'Taste our pongal,\nIt will become your favourite',
        'price': '\₹30',
      },
      {
        'image': 'assets/fish_fry.jpg',
        'title': 'Fish Fry',
        'description': 'Taste our Fish Fry,\nIt will become your favourite',
        'price': '\₹100',
      },
      {
      'image': 'assets/dragon_chicken.jpg',
      'title': 'Dragon Chicken',
      'description': 'Taste our Dragon Chicken,\nIt will become your favourite',
      'price': '\₹150',
    },
    {
      'image': 'assets/mutta_veech.jpg',
      'title': 'Egg Veech',
      'description': 'Taste our Egg Veech,\nIt will become your favourite',
      'price': '\₹50',
    },
    {
      'image': 'assets/mutton_gravy.jpg',
      'title': 'Mutton Gravy',
      'description': 'Taste our Mutton Gravy,\nIt will become your favourite',
      'price': '\₹100',
    },
    {
      'image': 'assets/img4.jpg',
      'title': 'Parotta',
      'description': 'Taste our Parotta,\nIt will become your favourite',
      'price': '\₹20',
    },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            return buildItem(item, context);
          }).toList(),
        ),
      ),
    );
  }

  Widget buildItem(Map<String, dynamic> item, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13),
      child: Container(
        width: double.infinity,
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
                    item['image'],
                    height: 120,
                    width: 150,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: MediaQuery.of(context).size.width - 190 - 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    item['title'],
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    item['description'],
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['price'],
                        style: TextStyle(
                          fontSize: 17,
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
                            // Add your onPressed function here
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
          ],
        ),
      ),
    );
  }
}
