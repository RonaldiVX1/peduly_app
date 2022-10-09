import 'package:flutter/material.dart';

Widget buildTitleText(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: Text(title,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20)),
  );
}
