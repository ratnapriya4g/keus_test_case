// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class TopMenus extends StatefulWidget {
  const TopMenus({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TopMenusState createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 232, 232, 232),
              ),
              child: const IconButton(
                onPressed: null,
                icon: Icon(Icons.filter),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          TopMenuTiles(
            name: "Salads",
          ),
          TopMenuTiles(
            name: "Pizza",
          ),
          TopMenuTiles(
            name: " Beverages ",
          ),
          TopMenuTiles(
            name: "Snacks",
          ),
        ],
      ),
    );
  }
}

class TopMenuTiles extends StatelessWidget {
  final String name;

  TopMenuTiles({
    Key? key,
    required this.name,
  }) : super(key: key);
  var page = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Row(
        children: [
          Container(
              height: 45,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 232, 232, 232),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                      color: Color.fromARGB(255, 255, 254, 254),
                      blurRadius: 25.0,
                      offset: Offset(0.0, 0.75),
                    ),
                  ]),
              child: Center(
                child: Text(name,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 3, 3, 3),
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              )),
          const SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}
