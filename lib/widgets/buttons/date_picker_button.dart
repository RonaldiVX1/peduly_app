import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget datePickerButton({
  @required String text,
  @required Function onPressed
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black26,
          width: 1,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // SvgPicture.asset("assets/ic_calendar.svg"),
            SizedBox(width: 10),
            Text(text),
          ],
        ),
      ),
    ),
  );
}