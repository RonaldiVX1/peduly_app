import 'package:flutter/material.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:peduly_app/widgets/theme/theme_weight.dart';

class FilterSquare extends StatelessWidget {
  const FilterSquare(this.icon, this.title);

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 24,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: pDetailTextStyle.copyWith(fontSize: 12, fontWeight: semiBold),
        ),
      ],
    );
  }
}
