// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_app/dashboard.dart';
import 'package:my_app/main.dart';

class CartItem extends StatefulWidget {
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
  const CartItem(
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
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int countProduct = 1;
  int countExtraProduct = 1;
  void addQuantity() {
    setState(() {
      countProduct++;
    });
  }

  void removeQuantity() {
    setState(() {
      (countProduct > 1) ? countProduct-- : countProduct;
    });
  }

  void addQuantityExtraProduct() {
    setState(() {
      countExtraProduct++;
    });
  }

  void removeQuantityExtraProduct() {
    setState(() {
      (countExtraProduct > 1) ? countExtraProduct-- : countExtraProduct;
    });
  }

  Widget quantityMeasureProduct() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: const Color.fromARGB(255, 234, 230, 230),
                    //   ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromARGB(255, 255, 254, 254),
                        blurRadius: 25.0,
                        offset: Offset(0.0, 0.75),
                      ),
                    ]),
                child: Center(
                  child: TextButton(
                    onPressed: removeQuantity,
                    child: Text(
                      "-",
                      style: TextStyle(
                          fontSize: 37,
                          decoration: TextDecoration.none,
                          color: (countProduct == 1)
                              ? const Color.fromARGB(255, 189, 185, 185)
                              : const Color.fromARGB(255, 33, 33, 33),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Center(
                child: Text(
                  '$countProduct',
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: const Color.fromARGB(255, 234, 230, 230),
                    //   ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromARGB(255, 255, 254, 254),
                        blurRadius: 25.0,
                        offset: Offset(0.0, 0.75),
                      ),
                    ]),
                child: Center(
                  child: TextButton(
                    onPressed: addQuantity,
                    child: const Text(
                      "+",
                      style: TextStyle(
                          fontSize: 37,
                          decoration: TextDecoration.none,
                          color: Color.fromARGB(255, 33, 33, 33),
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget quantityMeasureExtraProduct() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: const Color.fromARGB(255, 234, 230, 230),
                    //   ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromARGB(255, 255, 254, 254),
                        blurRadius: 25.0,
                        offset: Offset(0.0, 0.75),
                      ),
                    ]),
                child: Center(
                  child: TextButton(
                    onPressed: removeQuantityExtraProduct,
                    child: Text(
                      "-",
                      style: TextStyle(
                          fontSize: 37,
                          decoration: TextDecoration.none,
                          color: (countExtraProduct == 1)
                              ? const Color.fromARGB(255, 189, 185, 185)
                              : const Color.fromARGB(255, 33, 33, 33),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Center(
                child: Text(
                  '$countExtraProduct',
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: const Color.fromARGB(255, 234, 230, 230),
                    //   ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromARGB(255, 255, 254, 254),
                        blurRadius: 25.0,
                        offset: Offset(0.0, 0.75),
                      ),
                    ]),
                child: Center(
                  child: TextButton(
                    onPressed: addQuantityExtraProduct,
                    child: const Text(
                      "+",
                      style: TextStyle(
                          fontSize: 37,
                          decoration: TextDecoration.none,
                          color: Color.fromARGB(255, 33, 33, 33),
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget addCartOption() {
    return Container(
      height: 55,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      margin: const EdgeInsets.only(left: 15, right: 15),
      // ignore: prefer_const_constructors
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const MyApp()));
        },
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(right: 100),
                child: Text(
                  "Pay",
                  style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.none,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 0),
              child: Text(
                address.substring(16, 24),
                style: const TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w400),
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: ". ",
                      style: TextStyle(
                          fontSize: 27,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w900),
                    ),
                    TextSpan(
                      text: widget.price,
                      style: const TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w300),
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
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 15),
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "We will deliver in \n24 minutes to the address:",
                  style: TextStyle(
                      fontSize: 25,
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
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 5),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: address.substring(0, 17),
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 13, 13, 14),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: const TextButton(
                onPressed: null,
                child: Text(
                  "Change Address",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 219, 219, 226),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(60),
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                        const BoxShadow(
                          color: Color.fromARGB(255, 211, 205, 205),
                          blurRadius: 25.0,
                          offset: Offset(0.0, 0.75),
                        ),
                      ]),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.fill,
                  ),
                ),
                // ignore: prefer_const_constructors

                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0, left: 7),
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Color(0xFF3a3a3b),
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      quantityMeasureProduct(),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 2, right: 15),
                  child: Text(
                    widget.price,
                    style: const TextStyle(
                        fontSize: 23,
                        color: Color(0xFF3a3a3b),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w800),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                height: 16,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  Center(
                    child: const Icon(
                      Icons.soup_kitchen,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        "Cutley",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF3a3a3b),
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  quantityMeasureExtraProduct(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: Divider(
                height: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 15),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Delivery",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF3a3a3b),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 15),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Free delivery from \$30",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 219, 219, 226),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                  // ignore: prefer_const_constructors
                  child: Text(
                    "\$0.00",
                    style: TextStyle(
                        fontSize: 23,
                        color: Color(0xFF3a3a3b),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 15),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Payment Method",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 219, 219, 226),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 28, left: 15, right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black, width: 1.0),
                    // ignore: prefer_const_literals_to_create_immutables
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Center(
                          child: Icon(
                            Icons.apple,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Text(
                              "Pay",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                      ]),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 28, right: 150),
                  child: Text(
                    "Apple pay",
                    style: TextStyle(
                        fontSize: 17,
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
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        addCartOption(),
        const SizedBox(
          height: 50,
        ),
      ]),
    );
  }
}
