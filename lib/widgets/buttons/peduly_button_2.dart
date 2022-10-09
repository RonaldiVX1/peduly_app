import 'package:flutter/material.dart';

Widget pedulyButton2({
  @required BuildContext context,
  @required String text,
  @required bool isEnabled,
  @required Function() onPressed,
}) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: isEnabled ? Colors.deepOrange[800] : Colors.grey,
    minimumSize: Size(double.infinity, 36),
    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  return Container(
    height: 55,
    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
    child: ElevatedButton(
      style: raisedButtonStyle,
      child: Text(
        text,
        style: TextStyle(fontSize: 15),
      ),
      onPressed: isEnabled ? onPressed : (){},
    ),
  );
}
