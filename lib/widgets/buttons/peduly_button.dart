import 'package:flutter/material.dart';

Widget pedulyButton({
  @required BuildContext context,
  @required String text,
  @required bool isEnabled,
  @required Function() onPressed,
}) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    onPrimary: Colors.white,
    primary: isEnabled ? Color(0xffE7513B) : Colors.grey,
    minimumSize: Size(double.infinity, 0),
    padding: EdgeInsets.symmetric(vertical: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );

  return ElevatedButton(
    style: raisedButtonStyle,
    child: Text(
      text,
      style: TextStyle(fontSize: 16),
    ),
    onPressed: isEnabled ? onPressed : () {},
  );
}
