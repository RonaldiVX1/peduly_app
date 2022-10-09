import 'package:flutter/material.dart';

Widget pedulyGreyButton({
  @required String text,
  @required bool isEnabled,
  @required Function() onPressed,
}) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: isEnabled ? Colors.grey[300] : Colors.grey,
    minimumSize: Size(double.infinity, 30),
    elevation: 0,
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );

  return Container(
    height: 48,
    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
    child: ElevatedButton(
      style: raisedButtonStyle,
      child: Text(
        text,
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      onPressed: isEnabled ? onPressed : () {},
    ),
  );
}
