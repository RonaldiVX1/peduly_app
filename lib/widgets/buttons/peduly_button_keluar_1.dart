import 'package:flutter/material.dart';
import 'package:peduly_app/widgets/theme/theme_weight.dart';

class PedulyButtonKeluar1 extends StatelessWidget {
  PedulyButtonKeluar1({Key key, @required this.text, @required this.onPressed})
      : super(key: key);

  final String text;
  final Function() onPressed;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    onPrimary: Colors.white,
    primary: Colors.deepOrange,
    minimumSize: Size(181, 60),
    padding: EdgeInsets.only(top: 21, bottom: 17),
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
      height: 60,
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: ElevatedButton(
        style: raisedButtonStyle,
        child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: semiBold),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
