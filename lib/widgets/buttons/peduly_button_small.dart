import 'package:flutter/material.dart';

class PedulyButtonSmall extends StatelessWidget {
  PedulyButtonSmall(
      {Key key,
      @required this.text,
      @required this.onPressed,
      @required this.isEnabled})
      : super(key: key);

  final String text;
  final Function() onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.fromLTRB(32, 5, 10, 5),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            onPrimary: Colors.white,
            primary: isEnabled ? Colors.deepOrange[800] : Color(0xffE4E4E4),
            minimumSize: Size(80, 5),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          )),
    );
  }
}
