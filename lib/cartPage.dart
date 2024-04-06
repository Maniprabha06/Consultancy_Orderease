import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> selectedItems;

  const CartPage({Key? key, required this.selectedItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> uniqueItems = [];
  TextEditingController descriptionController = TextEditingController();


@override
void initState() {
  super.initState();
  // Initialize the uniqueItems list with the items from selectedItems
  uniqueItems = List.from(widget.selectedItems);
}

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
          Navigator.of(context).pop(); // Change to pop instead of pushReplacement
        },
        icon: const Icon(Icons.arrow_back),
      ),
    ),
    body: Column(
      children: [
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
                            // Remove the item from the cart
                            uniqueItems.removeAt(index);
                          });
                        },
                        icon: Icon(
                          Icons.delete_forever_rounded,
                          color: Colors.red,
                        ),
                      ),
                      // SizedBox(width: 1,),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            // Check if the item already exists
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
                            // Decrement quantity
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
          
          onPressed: () {
            // Handle place order action
          },
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.blue,
            backgroundColor: Colors.deepPurple,
             // Change the color as per your requirement
          ),
          child: Text('Place Order',
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