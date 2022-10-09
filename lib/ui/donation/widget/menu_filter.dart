import 'package:flutter/material.dart';

Widget menuFilter(
    {@required String text,
    @required bool isSelected,
    @required Function() menuFilterTap}) {
  return InkWell(
    child: Container(
      height: 25,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffC4C4C4), //                   <--- border color
          width: 1.0,
        ),
        color: isSelected ? Color(0xffC4C4C4) : Color(0xffFFFFFF),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: isSelected ? Color(0xff000000) : Color(0xffC4C4C4),
              fontSize: 10,
              fontWeight: FontWeight.normal,
              height: 1.2,
              letterSpacing: 1.0),
        ),
      ),
    ),
    onTap: menuFilterTap,
  );
}
