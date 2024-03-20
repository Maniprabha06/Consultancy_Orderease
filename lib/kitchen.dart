import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KitchenPage extends StatelessWidget {
  const KitchenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20, // Number of containers
        itemBuilder: (context, index) {
          // Build each container
          return SizedBox(
            height: 150, // Set the desired height
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
                      )
                    ],
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Align items to the center horizontally
                crossAxisAlignment: CrossAxisAlignment.center, // Align items to the center vertically
                children: [
                  Icon(Icons.table_restaurant_outlined), // Table icon
                  SizedBox(width: 15),
                  Text(
                    'Table_${index + 01}', // Table number
                    style: GoogleFonts.acme(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: KitchenPage(),
  ));
}
