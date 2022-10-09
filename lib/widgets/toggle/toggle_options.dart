import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

Widget toggleOptions({
  @required String text,
  @required bool value,
  @required Function(bool) onToggle,
  IconData icon,
}) {
  return Container(
    width: double.infinity,
    child: Row(
      children: [
        if (icon != null) ...[
          Icon(icon),
          SizedBox(
            width: 13.25,
          )
        ],
        Text(
          text,
          style: TextStyle(fontSize: 14),
        ),
        Spacer(),
        FlutterSwitch(
          value: value,
          onToggle: onToggle,
          height: 30,
          width: 50,
          activeToggleColor: Colors.white,
          activeToggleBorder:
              Border.all(width: 1, color: Colors.deepOrange[800]),
          activeColor: Colors.deepOrange[800],
          inactiveColor: Colors.transparent,
          toggleColor: Colors.black26,
          activeSwitchBorder:
              Border.all(width: 1, color: Colors.deepOrange[800]),
          inactiveSwitchBorder: Border.all(width: 1, color: Colors.black26),
        ),
      ],
    ),
  );
}
