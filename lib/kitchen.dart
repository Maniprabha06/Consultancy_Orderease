import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orderease_new/table_items_page.dart';

class KitchenPage extends StatelessWidget {
  const KitchenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitchen'),
      ),
      body: ListView.builder(
        itemCount: 20, // Number of tables
        itemBuilder: (context, index) {
          int tableNumber = index + 1; // Table number

          return GestureDetector(
            onTap: () {
              // Navigate to the TableItemsPage when a table is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TableItemsPage(tableNumber: tableNumber),
                ),
              );
            },
            child: Column(
              children: [
                SizedBox(
                  height: 250, // Set the desired height
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
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
                      image: DecorationImage(
                        image: AssetImage('assets/veggie.jpeg'), // Replace 'assets/veggie.jpeg' with your image path
                        fit: BoxFit.cover, // Cover the entire container
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.table_restaurant_outlined), // Table icon
                    SizedBox(width: 5),
                    Text(
                      'Table $tableNumber', // Table number
                      style: GoogleFonts.acme(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
