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
  String dropdownValue = 'Option 1';
  List<Map<String, dynamic>> uniqueItems = [];
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    uniqueItems = List.from(widget.selectedItems);
  }

  Future<void> _placeOrder() async {
    // Prepare data to be saved to Firebase
    List<Map<String, dynamic>> orderDetails = [];
    uniqueItems.forEach((item) {
      orderDetails.add({
        'itemName': item['title'],
        'count': item['quantity'],
      });
    });
    String suggestion = descriptionController.text;

    // Save order details to Firebase
    try {
      await FirebaseFirestore.instance.collection('orders').add({
        'orderDetails': orderDetails,
        'suggestion': suggestion,
        'timestamp': Timestamp.now(),
      });
      // Clear the cart and suggestion after placing the order
      setState(() {
        uniqueItems.clear();
        descriptionController.clear();
      });
      // Show a success message or navigate to a confirmation page
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Order placed successfully!'),
        ),
      );
    } catch (error) {
      // Handle errors
      print('Error placing order: $error');
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to place order. Please try again.'),
        ),
      );
    }
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
          Container(
            width:200,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
            child: DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
            dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5', 'Option 6', 'Option 7', 'Option 8', 'Option 9', 'Option 10', 'Option 11', 'Option 12']
            .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
                    );
                  }).toList(),
                ),
            ),
          ),
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
                        IconButton(
                          onPressed: () {
                            setState(() {
                              final existingIndex = uniqueItems.indexWhere(
                                      (item) => item['title'] == widget.selectedItems[index]['title']);
                              if (existingIndex != -1) {
                                uniqueItems[existingIndex]['quantity'] ??= 1;
                                uniqueItems[existingIndex]['quantity']++;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: Color.fromARGB(255, 248, 121, 11),
                          ),
                        ),
                        Text(
                          '${uniqueItems[index]['quantity'] ?? 1}',
                          style: GoogleFonts.acme(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (uniqueItems[index]['quantity'] != null &&
                                  uniqueItems[index]['quantity']! > 1) {
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
