import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MetodePembayaranDivider extends StatelessWidget {

  MetodePembayaranDivider({
    @required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200]
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 18, 16, 18),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
      ),
    );
  }

}