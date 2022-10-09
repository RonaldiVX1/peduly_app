import 'package:flutter/material.dart';

class PedulyButtonPengaturanKeluar extends StatelessWidget {
  PedulyButtonPengaturanKeluar({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function() onPressed;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    onPrimary: Colors.deepOrange,
    primary: Colors.white,
    minimumSize: Size(double.infinity, 36),
    shape: const RoundedRectangleBorder(
      side: BorderSide(
        width: 1,
        color: Colors.deepOrange,
      ),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
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
