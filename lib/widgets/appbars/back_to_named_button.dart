import 'package:flutter/material.dart';

Widget backToNamedButton(
    {@required String text, @required Function() onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.arrow_back_outlined),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}
