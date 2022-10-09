import 'package:flutter/material.dart';

import '../../../widgets/theme/theme_color.dart';

class DividerUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 29, left: 24),
      width: 1,
      height: 30,
      color: pTridGreyColor,
    );
  }
}
