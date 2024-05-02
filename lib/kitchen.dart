import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orderease_new/table_items_page.dart';

class KitchenPage extends StatelessWidget {
  const KitchenPage({Key? key}) : super(key: key);

  Future<bool> hasItems(int tableNumber) async {
    // Function to check if the given table has any items
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      // Query Firestore for the latest order for the given table number
      QuerySnapshot querySnapshot = await _firestore
          .collection('orders')
          .where('tableNumber', isEqualTo: 'Table $tableNumber')
          .orderBy('timestamp', descending: true)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final orderData = querySnapshot.docs.first.data() as Map<String, dynamic>?;
        final orderDetails = orderData?['orderDetails'] as List<dynamic>? ?? [];
        // Return true if there are order details, otherwise false
        return orderDetails.isNotEmpty;
      }
    } catch (e) {
      print('Error fetching order data for Table $tableNumber: $e');
    }

    return false; // No items if there was an error or no data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitchen'),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemCount: 20, // Number of tables
        itemBuilder: (context, index) {
          int tableNumber = index + 1; // Table number

          return FutureBuilder<bool>(
            future: hasItems(tableNumber), // Check if the table has items
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a loading indicator while fetching data
                return Center(child: CircularProgressIndicator());
              }

              // Determine the image based on the presence of items
              final String imagePath = snapshot.data == true
                  ? 'assets/reserved_table.jpg' // Reserved table image
                  : 'assets/unreserved_table.jpg'; // Unreserved table image

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
                            image: AssetImage(imagePath), // Use the determined image path
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
          );
        },
      ),
    );
  }
}
