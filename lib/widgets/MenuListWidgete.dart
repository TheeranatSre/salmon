// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuListWidget extends StatelessWidget {
  String name;
  String detail;
  String image;
  MenuListWidget({
    Key? key,
    required this.name,
    required this.detail,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Container(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 115, 0, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " รายละเอียด:",
                      style: TextStyle(
                          color: Color.fromARGB(255, 48, 48, 48),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "   - ${detail}",
                      style: TextStyle(
                          color: Color.fromARGB(255, 48, 48, 48),
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: Card(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Image.network(image),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
