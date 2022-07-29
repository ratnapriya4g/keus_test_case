// ignore: file_names
// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:my_app/food_List.dart';
import 'package:my_app/top_Menus.dart';

void main() => runApp(const MaterialApp(home: Dashboard()));

String address = "100a Ealing Rd . 24 mins";
bool pressed = false;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> pics = [
    'image/assets/Pizza.png',
    'image/assets/Banana.png',
    'image/assets/Candies.png',
    'image/assets/Cookie.png',
    'image/assets/Dessert.png',
    'image/assets/Dessert2.png',
    'image/assets/Food-Plate.png',
  ];
  Widget customCarousel() {
    return Stack(alignment: Alignment.bottomCenter, children: [
      MouseRegion(
        cursor: SystemMouseCursors.allScroll,
        child: CarouselSlider(
          options: CarouselOptions(
              height: 300.0,
              viewportFraction: 1,
              initialPage: 0,
              autoPlay: false,
              enlargeCenterPage: false,
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.hardEdge),
          items: pics.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 14.0),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xff87C6FE), Color(0xffCBCAFF)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 170, left: 0),
                              child: Text(
                                "Two slices of Pizza"
                                "\nwith delicious salami",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 170, bottom: 0),
                              child: Container(
                                height: 43,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(49),
                                  color: Colors.black,
                                ),
                                // ignore: prefer_const_constructors
                                child: Center(
                                  child: const Text(
                                    "\$12.40",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Image.asset(
                        i,
                        height: 190,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
      )
    ]);
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const IconButton(
            onPressed: null,
            padding: EdgeInsets.only(top: 60, left: 20),
            icon: Icon(
              Icons.apps_rounded,
              color: Colors.black,
              size: 30,
            )),
        Container(
          padding: const EdgeInsets.only(top: 60),
          child: Container(
            height: 45,
            width: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(49),
              color: Colors.black,
            ),
            // ignore: prefer_const_constructors
            child: Center(
              child: Text(
                address,
                style: const TextStyle(
                    //backgroundColor: Colors.black,
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
          ),
        ),
        const IconButton(
            onPressed: null,
            padding: EdgeInsets.only(top: 60, right: 20),
            icon: Icon(
              Icons.search_sharp,
              color: Colors.black,
              size: 30,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        primary: true,
        physics: const ClampingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          customAppBar(),
          Container(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: const Text(
              "Hits of the week",
              textAlign: TextAlign.start,
              // ignore: prefer_const_constructors
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 10,
          ),
          customCarousel(),
          const SizedBox(
            width: 15,
          ),
          (pressed)
              ? Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const TopMenus(),
                    const FoodList(),
                    Container(
                        padding: const EdgeInsets.all(80),
                        height: 20,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black,
                        ),
                        child: const TextButton(
                          onPressed: null,
                          // onPressed: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => CartItem(
                          //           image: image,
                          //           name: name,
                          //           description: description,
                          //           grams: grams,
                          //           price: price,
                          //           proteins: proteins,
                          //           carbs: carbs,
                          //           calories: calories,
                          //           fats: fats,
                          //           title: title,
                          //         ),
                          //       ));
                          // },
                          child: Text("Cart   24 min . \$47.00"),
                        )),
                  ],
                )
              : const TopMenus(),
          const FoodList()
          //  need to add one slider
        ]),

        // ignore: prefer_const_constructors
      ),
    );
  }
}
