import 'package:flutter/material.dart';

class PedulyButtonCornerSmall extends StatelessWidget {
  PedulyButtonCornerSmall(
      {Key key, @required this.text, @required this.onPressed})
      : super(key: key);

  final String text;
  final Function() onPressed;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    onPrimary: Colors.deepOrange,
    primary: Colors.white,
    minimumSize: Size(140, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      side: BorderSide(
        width: 1,
        color: Colors.deepOrange,
      ),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
      child: ElevatedButton(
        style: raisedButtonStyle,
        child: Text(
          text,
          style: TextStyle(fontSize: 15),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
