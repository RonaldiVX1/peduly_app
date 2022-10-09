import 'package:flutter/material.dart';

class PedulyButtonCorner2 extends StatelessWidget {
  PedulyButtonCorner2({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function() onPressed;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.deepOrange,
    primary: Colors.white,
    minimumSize: Size(double.infinity, 36),
    elevation: 0,
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      side: BorderSide(
        width: 1,
        color: Colors.deepOrange,
      ),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
