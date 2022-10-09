import 'package:flutter/material.dart';

Widget menggunakanReferal() {
  return Container(
    height: 65,
    width: double.infinity,
    margin: EdgeInsets.symmetric(vertical: 24),
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Color(0xffFCAE03).withOpacity(0.2),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Text(
          "Referensi hanya berlaku untuk donasi",
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          "COD",
          style:
              TextStyle(color: Color(0xffE7513B), fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
