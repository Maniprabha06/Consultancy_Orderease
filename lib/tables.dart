import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20, // Assuming there are 20 tables
                (index) {
              int tableNumber = index + 1;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
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
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            'assets/tab.jpg', // Update the asset path as needed
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Table $tableNumber',
                            style: GoogleFonts.acme(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
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
    final twilioFlutter = TwilioFlutter(
      accountSid: '*',//SID
      authToken: '*',//AUTH TOKEN
      twilioNumber: '+',//NUMBER
    );

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
        future: _fetchOrderData(tableNumber),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading order details: ${snapshot.error}'),
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

          final totalPrice = _calculateTotalPrice(orderDetails);

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
                    final price = item['price']?.toString() ?? '0';

                    return _buildFoodRow(context, itemName ?? 'Unknown Item', count?.toString() ?? '0', price);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Suggestion: $suggestion',
                  style: GoogleFonts.acme(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => _closeOrder(context, tableNumber, twilioFlutter, orderDetails, totalPrice),
                  child: Text(
                    'Close Order',
                    style: GoogleFonts.acme(fontSize: 16.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Total Price: ₹${totalPrice.toStringAsFixed(2)}',
                  style: GoogleFonts.acme(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<DocumentSnapshot> _fetchOrderData(int tableNumber) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('tableNumber', isEqualTo: 'Table $tableNumber')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first;
    } else {
      throw Exception('No data found');
    }
  }

  Widget _buildFoodRow(BuildContext context, String itemName, String quantity, String price) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
        locale: 'en_IN', // Use 'en_IN' for Indian locale
        symbol: '₹'); // Indian Rupee symbol

    final formattedPrice = currencyFormatter.format(double.parse(price));

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
          Text(formattedPrice),
        ],
      ),
    );
  }

  double _calculateTotalPrice(List<dynamic> orderDetails) {
    double totalPrice = 0.0;
    for (var item in orderDetails) {
      final price = double.tryParse(item['price']?.toString() ?? '0') ?? 0;
      final count = item['count'] as int?;
      totalPrice += price * (count ?? 1);
    }
    return totalPrice;
  }

  Future<void> _closeOrder(
      BuildContext context,
      int tableNumber,
      TwilioFlutter twilioFlutter,
      List<dynamic> orderDetails,
      double totalPrice) async {
    // Show confirmation dialog
    final confirmResult = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Close Order'),
          content: Text('Are you sure you want to close this order?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );

    if (confirmResult == true) {
      // Show the bill details in a pop-up dialog
      final billResult = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Bill for Table $tableNumber'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display order details
                  for (var item in orderDetails)
                    Text(
                      'Item: ${item['itemName']}\nCount: ${item['count']}\nPrice: ₹${item['price']}\n',
                      style: GoogleFonts.acme(fontSize: 14),
                    ),
                  SizedBox(height: 8),
                  // Display total price
                  Text(
                    'Total Price: ₹${totalPrice.toStringAsFixed(2)}',
                    style: GoogleFonts.acme(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Proceed'),
              ),
            ],
          );
        },
      );

      if (billResult == true) {
        // Ask for phone number
        final phoneNumber = await _askForPhoneNumber(context);
        if (phoneNumber != null) {
          // Fetch order document reference
          final orderDoc = await FirebaseFirestore.instance
              .collection('orders')
              .where('tableNumber', isEqualTo: 'Table $tableNumber')
              .orderBy('timestamp', descending: true)
              .limit(1)
              .get()
              .then((querySnapshot) => querySnapshot.docs.first.reference);

          // Update order to mark as closed
          await orderDoc.update({
            'orderDetails': [],
            'suggestion': null,
            'closed': true,
          });

          await FirebaseFirestore.instance.collection('phoneNumbers').add({
            'phoneNumber': phoneNumber,
            'tableNumber': tableNumber,
            'timestamp': FieldValue.serverTimestamp(),
          });

          // Construct the order details message for SMS
          final orderDetailsMessage = orderDetails.map((item) {
            final itemName = item['itemName'] as String?;
            final count = item['count'] as int?;
            final price = double.tryParse(item['price']?.toString() ?? '0') ?? 0;

            return 'Item: $itemName\nCount: $count\nPrice: ₹$price\n';
          }).join('\n');

          // Construct the full bill details message
          final billDetails = 'KUMAR MESS PVT LTD\nYOUR BILL\nOrder details for Table $tableNumber:\n$orderDetailsMessage\nTotal Price: ₹${totalPrice.toStringAsFixed(2)}\nThanks for visiting Kumar Mess.';

          // Send SMS with the bill details
          try {
            await twilioFlutter.sendSMS(
              toNumber: phoneNumber,
              messageBody: billDetails,
            );
            print('SMS sent successfully');
          } catch (e) {
            print('Failed to send SMS: $e');
          }

          // Go back after closing the order
          Navigator.pop(context);
        }
      }
    }
  }

  Future<String?> _askForPhoneNumber(BuildContext context) async {
    final phoneController = TextEditingController();

    final result = await showDialog<String?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Phone Number'),
          content: TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Phone Number',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(phoneController.text);
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );

    return result;
  }
}
