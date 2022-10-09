import 'package:flutter/material.dart';

Widget buildCategorySection(String arr) {
  return Container(
    height: 30,
    margin: const EdgeInsets.only(left: 16),
    child: ListView.builder(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _buildDetailCategoryItem(arr);
        }),
  );
}

Widget _buildDetailCategoryItem(String campaign) {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 11),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.deepOrange, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
    child: Text(campaign, style: TextStyle(color: Colors.deepOrange)),
  );
}
