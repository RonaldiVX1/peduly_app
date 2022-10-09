import 'package:flutter/material.dart';

Widget pedulyGreyButton2({
  @required String text,
  @required bool isEnabled,
  @required Function() onPressed,
}) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: isEnabled ? Colors.grey[300] : Colors.grey,
    minimumSize: Size(200, 30),
    elevation: 0,
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  return Container(
    height: 55,
    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
    child: ElevatedButton.icon(
      icon: Icon(Icons.chevron_left, color: Colors.black),
      style: raisedButtonStyle,
      label: Text(
        text,
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      onPressed: isEnabled ? onPressed : () {},
    ),
  );
}
