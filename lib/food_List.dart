// ignore: file_names

import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'food_item_details.dart';

class FoodList extends StatefulWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          FoodListTiles(
              name: "Poke with chicken \nand corn",
              price: "\$47.00",
              calories: "325",
              image: "image/assets/Grilled-Chicken.png",
              description:
                  "Famous Hawaiian dish. Rice pillow with tender chicken breast, mushrooms, lettuce, cherry tomatoes, seaweed and corn, with unagi sauce.",
              grams: "420",
              proteins: "21",
              fats: "19",
              carbs: "65",
              title: "poke"),
          FoodListTiles(
              name: "Salad with radishes,\ntomatoes and mushrooms",
              price: "\$89.00",
              calories: "454",
              image: "image/assets/Salad2.png",
              description: "Healthy Salad with huge amount of Proteins.",
              grams: "420",
              proteins: "700",
              fats: "20",
              carbs: "100",
              title: "Salad"),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class FoodListTiles extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final String calories;
  final String description;
  final String grams;
  final String proteins;
  final String fats;
  final String carbs;
  final String title;
  FoodListTiles({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
    required this.calories,
    required this.description,
    required this.grams,
    required this.proteins,
    required this.fats,
    required this.carbs,
    required this.title,
  }) : super(key: key);
  var page = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCupertinoModalBottomSheet(
          expand: true,
          isDismissible: true,
          barrierColor: const Color(0xFFBFC7C7),
          enableDrag: true,
          topRadius: const Radius.circular(50),
          bounce: true,
          context: context,
          elevation: 1.5,
          animationCurve: Curves.easeInOut,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shadow: const BoxShadow(
            color: Color.fromARGB(255, 235, 230, 230),
            blurRadius: 20.0,
            offset: Offset(0.0, 0.75),
          ),
          backgroundColor: Colors.white,
          builder: (context) => FoodItemDetails(
            image: image,
            name: name,
            description: description,
            grams: grams,
            price: price,
            proteins: proteins,
            carbs: carbs,
            calories: calories,
            fats: fats,
            title: title,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(60),
                  //   ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                      color: Color.fromARGB(255, 211, 205, 205),
                      blurRadius: 25.0,
                      offset: Offset(0.0, 0.75),
                    ),
                  ]),
              child: Image.asset(
                image,
                // height: 140,
                // width: 50,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 28,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: name,
                            style: const TextStyle(
                                fontSize: 17,
                                color: Color(0xFF3a3a3b),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 73,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromARGB(255, 232, 232, 232),
                        ),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: price,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFF3a3a3b),
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 10.0),
                        child: Text(
                          "$calories Kcal",
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 200, 200, 203),
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
