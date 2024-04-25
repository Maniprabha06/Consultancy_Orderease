import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//Hello
class TablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tables',
          style: GoogleFonts.acme(fontSize: 20.0),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: 20, // Update the number of tables here
          itemBuilder: (context, index) {
            int tableNumber = index + 1;
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderedFoodDetailsPage(tableNumber: tableNumber),
                  ),
                );
              },
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/veg.jpeg', // Update asset path if needed
                      height: 100.0,
                      width: 100.0,
                    ),
                    Text(
                      'Table $tableNumber',
                      style: GoogleFonts.acme(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class OrderedFoodDetailsPage extends StatelessWidget {
  final int tableNumber;

  OrderedFoodDetailsPage({required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Table $tableNumber Order Details',
          style: GoogleFonts.acme(fontSize: 20.0),
        ),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('orders')
            .where('tableNumber', isEqualTo: 'Table $tableNumber')
            .orderBy('timestamp', descending: true)
            .limit(1)
            .get()
            .then((querySnapshot) {
          if (querySnapshot.docs.isNotEmpty) {
            return querySnapshot.docs.first;
          } else {
            throw Exception('No data found');
          }
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading order details: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('No order data found for Table $tableNumber'),
            );
          }

          final orderData = snapshot.data?.data() as Map<String, dynamic>?;

          if (orderData == null || orderData.isEmpty) {
            return Center(
              child: Text('Currently no orders for Table $tableNumber'),
            );
          }

          final orderDetails = orderData['orderDetails'] as List<dynamic>? ?? [];
          final suggestion = orderData['suggestion'] as String?;

          if (orderDetails.isEmpty) {
            return Center(
              child: Text('Currently no orders for Table $tableNumber'),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(20.0),
                  itemCount: orderDetails.length,
                  itemBuilder: (context, index) {
                    final item = orderDetails[index];
                    final itemName = item['itemName'] as String?;
                    final count = item['count'] as int?;

                    return buildFoodRow(itemName ?? 'Unknown Item', count?.toString() ?? '0');
                  },
                ),
              ),
              // Add the "Close Order" button at the bottom of the page
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // Show the confirmation dialog
                    final result = await showDialog<bool>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Close Order'),
                          content: Text('Are you sure you want to close this order?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // User selected "No"
                                Navigator.of(context).pop(false);
                              },
                              child: Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                // User selected "Yes"
                                Navigator.of(context).pop(true);
                              },
                              child: Text('Yes'),
                            ),
                          ],
                        );
                      },
                    );

                    // If the user confirmed, proceed with closing the order
                    if (result == true) {
                      // Close the order by updating the Firestore document
                      final orderDoc = await FirebaseFirestore.instance
                          .collection('orders')
                          .where('tableNumber', isEqualTo: 'Table $tableNumber')
                          .orderBy('timestamp', descending: true)
                          .limit(1)
                          .get()
                          .then((querySnapshot) => querySnapshot.docs.first.reference);

                      // Update the order document to mark the order as closed
                      await orderDoc.update({
                        'orderDetails': [],
                        'suggestion': null,
                        'closed': true, // Add a field to track if the order is closed
                      });

                      // Navigate back to the previous page after closing the order
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Close Order',
                    style: GoogleFonts.acme(fontSize: 16.0),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildFoodRow(String itemName, String quantity) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(itemName),
          Text(quantity),
        ],
      ),
    );
  }
}