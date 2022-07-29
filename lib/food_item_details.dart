import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:my_app/item_Cart.dart';

class FoodItemDetails extends StatefulWidget {
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

  const FoodItemDetails(
      {Key? key,
      required this.name,
      required this.image,
      required this.price,
      required this.calories,
      required this.description,
      required this.grams,
      required this.proteins,
      required this.fats,
      required this.carbs,
      required this.title})
      : super(key: key);

  @override
  State<FoodItemDetails> createState() => _FoodItemDetailsState();
}

class _FoodItemDetailsState extends State<FoodItemDetails> {
  int count = 1;
  void addQuantity() {
    setState(() {
      count++;
    });
  }

  void removeQuantity() {
    setState(() {
      (count > 1) ? count-- : count;
    });
  }

  Widget customPageDesignNameImage() {
    return Center(
      child: Container(
          height: 290,
          width: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60),

              //   ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                  color: Color.fromARGB(255, 228, 228, 233),
                  blurRadius: 25.0,
                  offset: Offset(0.0, 0.75),
                ),
              ]),
          child: Center(
            child: Image.asset(
              widget.image,
              height: 250,
              width: 250,
              fit: BoxFit.fill,
            ),
          )),
    );
  }

  Widget customQualityDesign() {
    return Container(
      height: 55,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 232, 232, 232),
          //   ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Color.fromARGB(255, 255, 254, 254),
              blurRadius: 25.0,
              offset: Offset(0.0, 0.75),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          Center(
            child: TextButton(
              onPressed: removeQuantity,
              child: Text(
                "-",
                style: TextStyle(
                    fontSize: 67,
                    decoration: TextDecoration.none,
                    color: (count == 1)
                        ? const Color.fromARGB(255, 189, 185, 185)
                        : const Color.fromARGB(255, 33, 33, 33),
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
          Center(
            child: Text(
              "$count",
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: addQuantity,
              child: const Text(
                "+",
                style: TextStyle(
                    fontSize: 47,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 33, 33, 33),
                    fontWeight: FontWeight.w100),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addCartOption() {
    return Container(
      height: 55,
      width: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),

      // ignore: prefer_const_constructors
      child: TextButton(
        onPressed: () {
          showCupertinoModalBottomSheet(
            expand: true,
            isDismissible: true,
            barrierColor: const Color(0xFFBFC7C7),
            enableDrag: true,
            topRadius: const Radius.circular(50),
            bounce: true,
            context: context,
            elevation: 1.5,
            animationCurve: Curves.easeInOutBack,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shadow: const BoxShadow(
              color: Color.fromARGB(255, 235, 230, 230),
              blurRadius: 20.0,
              offset: Offset(0.0, 0.75),
            ),
            backgroundColor: Colors.white,
            builder: (context) => CartItem(
              image: widget.image,
              name: widget.name,
              description: widget.description,
              grams: widget.grams,
              price: widget.price,
              proteins: widget.proteins,
              carbs: widget.carbs,
              calories: widget.calories,
              fats: widget.fats,
              title: widget.title,
            ),
          );
        },
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(
              child: Text(
                "Add to cart",
                style: TextStyle(
                    fontSize: 17,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w400),
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.price,
                      style: const TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      primary: true,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        customPageDesignNameImage(),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 15),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.name,
                  style: const TextStyle(
                      fontSize: 27,
                      color: Color(0xFF3a3a3b),
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 5),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.description,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 219, 219, 226),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: const Color.fromARGB(255, 220, 216, 216),
                width: 0.2,
                style: BorderStyle.solid),

            //   ignore: prefer_const_literals_to_create_immutables
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              flex: 1,
              child: Column(children: [
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.calories,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 2, 2, 2),
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "kcal",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 213, 213, 221),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Column(children: [
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.grams,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 2, 2, 2),
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "grams",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 213, 213, 221),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Column(children: [
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.proteins,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 2, 2, 2),
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "proteins",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 213, 213, 221),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Column(children: [
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.fats,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 2, 2, 2),
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "fats",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 213, 213, 221),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Column(children: [
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.carbs,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 2, 2, 2),
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "carbs",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 213, 213, 221),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ]),
            ),
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28, left: 15, right: 15),
              child: Text(
                "Add in ${widget.title}",
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 28, left: 15, right: 15),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Colors.black,
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              customQualityDesign(),
              addCartOption(),
            ],
          ),
        ),
        const SizedBox(height: 20)
      ]),
    );
  }
}

// void showToast() {
//   Fluttertoast.showToast(
//       msg: 'This is toast notification',
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIos: 1,
//       backgroundColor: Colors.red,
//       textColor: Colors.yellow);
// }

