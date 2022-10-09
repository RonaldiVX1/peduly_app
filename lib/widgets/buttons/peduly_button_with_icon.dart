import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PedulyButtonWithIcon extends StatelessWidget {
  PedulyButtonWithIcon(
      {Key key,
      @required this.icon,
      @required this.text,
      @required this.onPressed})
      : super(key: key);

  final Widget icon;
  final String text;
  final Function() onPressed;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    onPrimary: Colors.white,
    primary: Colors.deepOrange[800],
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: ElevatedButton.icon(
        style: raisedButtonStyle,
        onPressed: onPressed,
        icon: icon,
        label: Text(text),
      ),
    );
  }
}
