import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget referenceCode({
  @required TextEditingController controller,
}) {
  return Container(
    width: 250,
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.black26),
      borderRadius: BorderRadius.circular(15)
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 16,),
      child: Container(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.check_circle, color: Colors.green),
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey[300]),
            hintText: "Donasi mulai 10.000",
          ),
        ),
      ),
    ),
  );
}
