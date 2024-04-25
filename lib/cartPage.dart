import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> selectedItems;

  const CartPage({Key? key, required this.selectedItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Variable to hold the selected table number
  String selectedTable = 'Table 1';
  // List of table numbers from Table 1 to Table 20
  List<String> tableNumbers = List.generate(20, (index) => 'Table ${index + 1}');
  // List to hold the unique items in the cart
  List<Map<String, dynamic>> uniqueItems = [];
  // Text controller for capturing user suggestion
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize uniqueItems based on selectedItems and set default quantity to 1
    uniqueItems = widget.selectedItems.map((item) {
      return {
        'title': item['title'],
        'quantity': item['quantity'] ?? 1, // Default quantity to 1 if null
        'imagePath': item['imagePath'],
        'price': item['price'],
      };
    }).toList();
  }

  // Function to place an order and save data to Firestore
  Future<void> _placeOrder() async {
    // Prepare data to be saved to Firestore
    List<Map<String, dynamic>> newOrderDetails = uniqueItems.map((item) {
      return {
        'itemName': item['title'],
        'count': item['quantity'],
        'price': item['price'], // Include the price field
      };
    }).toList();

    // Retrieve suggestion from the text field
    String suggestion = descriptionController.text;

    // Query to find an existing order for the selected table
    final querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('tableNumber', isEqualTo: selectedTable)
        .where('closed', isEqualTo: false) // Only consider open orders
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // An existing order is found for the selected table
      final existingOrderDoc = querySnapshot.docs.first;
      final existingOrderData = existingOrderDoc.data();

      // Retrieve existing order details
      List<Map<String, dynamic>> existingOrderDetails = List<Map<String, dynamic>>.from(existingOrderData['orderDetails']);

      // Merge the existing order details with the new order details
      for (var newItem in newOrderDetails) {
        bool itemExists = false;

        // Check if the new item already exists in the existing order
        for (var existingItem in existingOrderDetails) {
          if (existingItem['itemName'] == newItem['itemName']) {
            // Item exists, update its count and price
            existingItem['count'] += newItem['count'];
            // Ensure price is consistent
            existingItem['price'] = newItem['price'];
            itemExists = true;
            break;
          }
        }

        // If the item does not exist, add it to the existing order details
        if (!itemExists) {
          existingOrderDetails.add(newItem);
        }
      }

      // Update the existing Firestore document with the merged order details
      await existingOrderDoc.reference.update({
        'orderDetails': existingOrderDetails,
        'suggestion': suggestion, // Update the suggestion as well
        'timestamp': Timestamp.now(),
      });
    } else {
      // No existing order found, create a new order document
      await FirebaseFirestore.instance.collection('orders').add({
        'orderDetails': newOrderDetails,
        'tableNumber': selectedTable,
        'suggestion': suggestion,
        'timestamp': Timestamp.now(),
        'closed': false, // Ensure the order is marked as open
      });
    }

    // Clear the cart and reset the selected table and suggestion text field
    setState(() {
      uniqueItems.clear();
      descriptionController.clear();
      selectedTable = 'Table 1';
    });

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Order placed successfully!'),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 2.0),
          child: Text(
            'My Cart Page',
            style: GoogleFonts.acme(
              fontSize: 20.0,
            ),
          ),
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle_sharp),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.pink,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          // Dropdown menu for selecting table numbers
          Container(
            width: 200,
            child: DropdownButton<String>(
              value: selectedTable,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTable = newValue!;
                });
              },
              items: tableNumbers.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          // List of items in the cart
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: uniqueItems.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      uniqueItems[index]['imagePath'],
                      width: 20,
                      height: 20,
                    ),
                    title: Text(
                      uniqueItems[index]['title'],
                      style: GoogleFonts.acme(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      uniqueItems[index]['price'],
                      style: GoogleFonts.acme(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Delete item from the cart
                        IconButton(
                          onPressed: () {
                            setState(() {
                              uniqueItems.removeAt(index);
                            });
                          },
                          icon: Icon(
                            Icons.delete_forever_rounded,
                            color: Colors.red,
                          ),
                        ),
                        // Increase item quantity
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (uniqueItems[index]['quantity'] == null) {
                                uniqueItems[index]['quantity'] = 1;
                              }
                              uniqueItems[index]['quantity']++;
                            });
                          },
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: Color.fromARGB(255, 248, 121, 11),
                          ),
                        ),
                        // Display item quantity
                        Text(
                          '${uniqueItems[index]['quantity']}',
                          style: GoogleFonts.acme(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                        // Decrease item quantity
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (uniqueItems[index]['quantity'] != null &&
                                  uniqueItems[index]['quantity'] > 1) {
                                uniqueItems[index]['quantity']--;
                              }
                            });
                          },
                          icon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.remove_circle_outline,
                              color: Color.fromARGB(255, 248, 121, 11),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          // Text field for user suggestion
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Give us suggestions if any...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Button to place order
          ElevatedButton(
            onPressed: _placeOrder,
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.blue,
              backgroundColor: Colors.deepPurple,
            ),
            child: Text(
              'Place Order',
              style: GoogleFonts.acme(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
