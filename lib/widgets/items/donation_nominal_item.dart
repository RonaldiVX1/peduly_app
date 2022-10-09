import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget donationNominalItem(
    {@required int nominal,
    @required Color color,
    @required Function() onPressed}) {
  return Expanded(
    flex: 1,
    child: InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 19),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: color),
        ),
        child: Text(
          "Rp $nominal",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ),
    ),
  );
}
