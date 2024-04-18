import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TablePage extends StatelessWidget {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: SingleChildScrollView(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              mainAxisSpacing: 25,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // Navigate to the details page when a container is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderedFoodDetailsPage(
                        tableNumber: index + 1,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3, // Take 3/4 of the available space
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Image.asset(
                            'assets/veg.jpeg',
                            fit: BoxFit.fill, // Adjust fit here
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        flex: 1, // Take 1/4 of the available space
                        child: Text(
                          'Table_${index + 1}',
                          style: GoogleFonts.acme(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
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
        title: Padding(
          padding: const EdgeInsets.only(right: 2.0),
          child: Text(
            'Table $tableNumber order details...',
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
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                buildFoodRow('Dosa', '1'),
                buildFoodRow('Pongal', '2'),
                buildFoodRow('Poori', '2'),
                // Add more food rows for other food items as needed
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(2.5),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
              shadowColor: Colors.blue,
              backgroundColor: Colors.deepPurple,
            ),
                onPressed: () {
                  // Add functionality for the button
                },
                child: Text(
                  'Add Items',
                  style: GoogleFonts.acme(
                fontSize: 16.0,
                color: Colors.black,
              ),
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFoodRow(String itemName, String quantity) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            itemName,
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            quantity,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
