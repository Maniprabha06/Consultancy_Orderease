import 'package:flutter/material.dart';
import 'package:orderease_new/cart_model.dart';
import 'package:orderease_new/db_helper.dart';
import 'package:orderease_new/cart_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  
  List<String> productName = ['Dosa','Briyani','kariDosa','fish_fry','lollipop','pongal','Chicken_wings'];
  List<int> productPrice = [40, 100, 70 ,65 , 110 , 50 ,120];
  List<String> productImage = [
    "assets/dosai.jpg",
    "assets/mutton_biriyani.jpg",
    "assets/kari_dosai.jpg",
    "assets/fish_fry.jpg",
    "assets/lollipop.jpg",
    "assets/pongal.jpeg",
    "assets/chicken wings.jpg",
  ];
  
   DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Column( // Wrap with Column
        children: [
          SizedBox(height: 20,),
          Container(
            height: 50,
            width: 490,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search here...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.filter_list),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
           Expanded(
            child: ListView.builder(
                itemCount: productName.length,
                itemBuilder: (context, index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image(
                            height: 100,
                            width: 100,
                            image: NetworkImage(productImage[index].toString()),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(productName[index].toString() ,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 5,),
                                Text(productPrice[index].toString() ,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 5,),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: (){
                                      print(index);
                                      print(index);
                                      print(productName[index].toString());
                                      print( productPrice[index].toString());
                                      print( productPrice[index]);
                                      print('1');
                                      print(productImage[index].toString());

                                      dbHelper!.insert(
                                        Cart(
                                            id: index,
                                            productId: index.toString(),
                                            productName: productName[index].toString(),
                                            initialPrice: productPrice[index],
                                            productPrice: productPrice[index],
                                            quantity: 1,
                                            image: productImage[index].toString())
                                      ).then((value){

                                        cart.addTotalPrice(double.parse(productPrice[index].toString()));
                                        cart.addCounter();

                                        final snackBar = SnackBar(backgroundColor: Colors.green,content: Text('Product is added to cart'), duration: Duration(seconds: 1),);

                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                      }).onError((error, stackTrace){
                                        print("error"+error.toString());
                                        final snackBar = SnackBar(backgroundColor: Colors.red ,content: Text('Product is already added in cart'), duration: Duration(seconds: 1));

                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      });
                                    },
                                    child:  Container(
                                      height: 35,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: const Center(
                                        child:  Text('Add to cart' , style: TextStyle(color: Colors.white),),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )

                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
