import 'package:flutter/material.dart';

Widget kodeReferal() {
  return Container(
      padding: EdgeInsets.only(left: 17, right: 21),
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(
                  color: Color(0xff212121),
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal),
              decoration: InputDecoration.collapsed(hintText: "Kode Referal"),
            ),
          ),
          SizedBox(width: 5),
          Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
        ],
      ));
}
