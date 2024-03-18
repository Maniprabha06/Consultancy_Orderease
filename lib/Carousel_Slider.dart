import 'package:flutter/material.dart';
import 'dart:async';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({Key? key}) : super(key: key);

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider>
    with TickerProviderStateMixin {
  List<String> assets = [
    'assets/img6.jpg',
    'assets/img2.jpg',
    'assets/img3.jpg',
    'assets/img4.jpg',
    'assets/img8.jpg',
    'assets/img5.jpg'
  ];
  final color = [
    Colors.red,
    Colors.amber,
    Colors.teal,
    Colors.purple,
    Colors.blueGrey,
    Colors.blue,
  ];

  int myfirstcurrentindex = 0;
  PageController myfirstpagecontroller =
      PageController(initialPage: 0, viewportFraction: 0.8);
  bool isreverse = false;

  myfirstfunction() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (myfirstcurrentindex == 4) {
        isreverse = true;
      } else if (myfirstcurrentindex == 0) {
        isreverse = false;
      }
      isreverse ? myfirstcurrentindex-- : myfirstcurrentindex++;
      myfirstpagecontroller.animateToPage(myfirstcurrentindex,
          duration: const Duration(seconds: 1), curve: Curves.linear);
    });
  }

  int secondecurrentindex = 3;
  PageController mysecondcontroller =
      PageController(initialPage: 3, viewportFraction: 0.7);
  mysecondfunction() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      secondecurrentindex++;
      mysecondcontroller.animateToPage(secondecurrentindex,
          duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
    });
  }

  int thirdcurrentindex = 3;
  PageController mythirdcontroller =
      PageController(initialPage: 3, viewportFraction: 0.7);
  bool isstop = false;
  mythirdfunction() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      isstop ? 0 : thirdcurrentindex++;
      mythirdcontroller.animateToPage(thirdcurrentindex,
          duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
    });
  }

  @override
  void initState() {
    super.initState();
    myfirstfunction();
    mysecondfunction();
    mythirdfunction();
  }

  @override
  void dispose() {
    super.dispose();
    myfirstpagecontroller.dispose();
    mysecondcontroller.dispose();
    mythirdcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 250,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  itemCount: assets.length,
                  physics: const BouncingScrollPhysics(),
                  controller: myfirstpagecontroller,
                  onPageChanged: (value) {
                    myfirstcurrentindex = value;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset(
                        assets[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              TabPageSelector(
                controller: TabController(
                  length: assets.length,
                  vsync: this,
                  initialIndex: myfirstcurrentindex,
                ),
              ),
              // Add other widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}
