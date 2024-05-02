import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsPage extends StatelessWidget {
  final String tableNumber;
  final List<dynamic> orderDetails;

  const OrderDetailsPage({Key? key, required this.tableNumber, required this.orderDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details ($tableNumber)',
          style: GoogleFonts.acme(fontSize: 20.0),
        ),
        centerTitle: false,
        backgroundColor: Colors.pink,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),

      body: ListView.builder(
        itemCount: orderDetails.length,
        itemBuilder: (context, index) {
          final item = orderDetails[index];
          return ListTile(
            title: Text(
              item['itemName'],
              style: GoogleFonts.acme(fontSize: 16),
            ),
            subtitle: Text(
              'Count: ${item['count']}, Price: ₹${item['price']}',
              style: GoogleFonts.acme(fontSize: 12),
            ),
          );
        },
      ),
    );
  }
}
