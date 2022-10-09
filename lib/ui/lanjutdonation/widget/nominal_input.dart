import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget nomimalInput({
  @required Function() onPressed,
  @required Color color,
  @required TextEditingController controller,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: 130,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Masukkan nominal donasi", style: TextStyle(),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Row(
                  children: [
                    Text("Rp", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      width: 200,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: TextField(
                          controller: controller,
                          keyboardType: TextInputType.number,
                          onTap: onPressed,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey[300]),
                            hintText: "Donasi mulai 10.000"
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
