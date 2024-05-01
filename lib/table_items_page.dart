import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class TableItemsPage extends StatefulWidget {
  final int tableNumber;

  const TableItemsPage({Key? key, required this.tableNumber}) : super(key: key);

  @override
  _TableItemsPageState createState() => _TableItemsPageState();
}

class _TableItemsPageState extends State<TableItemsPage> {
  bool orderReady = false;

  Future<Map<String, dynamic>?> fetchOrderData() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      // Query Firestore for the latest order for the given table number
      QuerySnapshot querySnapshot = await _firestore
          .collection('orders')
          .where('tableNumber', isEqualTo: 'Table ${widget.tableNumber}')
          .orderBy('timestamp', descending: true)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Return the data from the latest order document
        return querySnapshot.docs.first.data() as Map<String, dynamic>?;
      }
    } catch (e) {
      print('Error fetching order data for Table ${widget.tableNumber}: $e');
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table ${widget.tableNumber} Items'),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: fetchOrderData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final orderData = snapshot.data;

          // Handle case where there is no order data
          if (orderData == null) {
            return Center(
              child: Text(
                'No current orders for Table ${widget.tableNumber}',
                style: GoogleFonts.acme(fontSize: 16),
              ),
            );
          }

          final orderDetails = orderData['orderDetails'] as List<dynamic>? ?? [];

          // Handle case where there are no order details
          if (orderDetails.isEmpty) {
            return Center(
              child: Text(
                'No current orders for Table ${widget.tableNumber}',
                style: GoogleFonts.acme(fontSize: 16),
              ),
            );
          }

          final suggestion = orderData['suggestion'] as String?;

          // Display order details and the suggestion text
          return Column(
            children: [
              // Display the suggestion text if available
              if (suggestion != null && suggestion.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Suggestion: $suggestion',
                    style: GoogleFonts.acme(fontSize: 16, color: Colors.grey),
                  ),
                ),
              // Display the list of order details
              Expanded(
                child: ListView.builder(
                  itemCount: orderDetails.length,
                  itemBuilder: (context, index) {
                    final item = orderDetails[index];
                    final itemName = item['itemName'] ?? 'Unknown Item';
                    final count = item['count'] ?? 0;

                    // Determine the border color based on whether the order is ready
                    Color borderColor = orderReady ? Colors.green : Colors.red;

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        '$itemName: $count',
                        style: GoogleFonts.acme(fontSize: 16),
                      ),
                    );
                  },
                ),
              ),
              // Display button when there are order details
              ElevatedButton(
                onPressed: () {
                  // Set the orderReady state to true
                  setState(() {
                    orderReady = true;
                  });

                  // Show the dialog to indicate order readiness
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Order Ready'),
                        content: Text('Order for Table ${widget.tableNumber} is ready!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Dismiss the dialog
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Order Ready'),
              ),
              SizedBox(height: 16), // Add some spacing below the button
            ],
          );
        },
      ),
    );
  }
}