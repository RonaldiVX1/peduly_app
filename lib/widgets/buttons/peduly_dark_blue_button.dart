import 'package:flutter/material.dart';

Widget pedulyDarkBlueButton({
  @required BuildContext context,
  @required String text,
  @required bool isEnabled,
  @required Function() onPressed,
}) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: isEnabled ? Color(0xFF003456) : Colors.grey,
    minimumSize: Size(double.infinity, 48),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );

  return Container(
    height: 72,
    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
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
