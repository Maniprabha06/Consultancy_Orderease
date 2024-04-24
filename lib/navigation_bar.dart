import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderease_new/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orderease_new/tables.dart';
import 'package:orderease_new/kitchen.dart';
import 'package:orderease_new/SearchPage.dart';

// import 'package:orderease_new/Carousel_Slider.dart';


class Navigationbar extends StatelessWidget{
  const Navigationbar({super.key});
  

  @override build(BuildContext context){
    final controller = Get.put(Navigationcontroller());
    return Scaffold(
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: Text(
              'Orderease',
              style: GoogleFonts.acme( // Example: Using Open Sans font
                fontSize: 20.0,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          centerTitle: false,
          actions: [
                IconButton(
                  icon: Icon(Icons.account_circle_sharp),
                  onPressed: () {
                    Navigator.pushNamed(context, 'profilePage');
                  },
                ),

              ],
          backgroundColor: Colors.pink,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.food_bank,
            
            ),
          ),
          // ignore: prefer_const_constructors
          
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(25),
          //     bottomRight: Radius.circular(25),
          //   ),
          // ),
        ),
        
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 80,
          backgroundColor: Colors.pink,
          elevation: 0,
          selectedIndex: controller.selectedindex.value,
          onDestinationSelected: (index)=> controller.selectedindex.value = index,
          destinations: [
            NavigationDestination(icon: Icon(Icons.menu_book), label: 'MENU'),
            NavigationDestination(icon: Icon(Icons.search), label: 'SEARCH'),
            NavigationDestination(icon: Icon(Icons.table_restaurant_outlined), label: 'TABLES'),
            NavigationDestination(icon: Icon(Icons.kitchen_outlined), label: 'KITCHEN'),
          ],
        ),
      ),
      body: Obx(()=> controller.screens[controller.selectedindex.value]),
    );
  }
}
class Navigationcontroller extends GetxController{
  final Rx<int> selectedindex = 0.obs;
  final screens =[HomePageWidget(),
    SearchPage(),
    TablePage(),
    KitchenPage(),
  ];
}