import 'package:flutter/material.dart';

import '../../../widgets/theme/theme_color.dart';

class BorderIcon extends StatelessWidget {
  BorderIcon(this.icon);

  String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: pSecondGreyColor, width: 1),
      ),
      child: Image.asset(
        icon,
        width: 41,
      ),
    );
  }
}
