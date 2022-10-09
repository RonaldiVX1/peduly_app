import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/category.dart';

Widget categoryItem({Category category}) {
  return Center(
    child: Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3), blurRadius: 6, color: Colors.black12),
          ]),
      margin: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 26,
          ),
          Icon(
            category.icon.icon,
            color: Colors.deepOrange,
          ),
          SizedBox(
            width: 8,
          ),
          Text(category.title),
          SizedBox(
            width: 26,
          ),
        ],
      ),
    ),
  );
}
