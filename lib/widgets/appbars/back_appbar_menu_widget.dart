import 'package:flutter/material.dart';

Widget backAppBarMenuWidget({@required BuildContext context}) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.arrow_back_outlined),
          SizedBox(
            width: 5,
          ),
          Text(
            'Kembali',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}
