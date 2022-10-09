import 'package:flutter/material.dart';

Widget buildPenerimaItem({@required String penerimaName}) {
  return SizedBox(
    height: 45,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 30,
          child: Icon(Icons.person),
        ),
        SizedBox(
          width: 12,
        ),
        Text(penerimaName)
      ],
    ),
  );
}
