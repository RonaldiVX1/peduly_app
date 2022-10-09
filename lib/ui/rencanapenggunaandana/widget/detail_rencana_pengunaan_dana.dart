import 'package:flutter/material.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:peduly_app/widgets/theme/theme_weight.dart';

Widget detailRencanaPenggunaanDana(
  String icon,
  String title,
  String keterangan,
  String biaya,
) {
  return Padding(
    padding: EdgeInsets.all(24),
    child: Row(
      children: [
        Image.asset(
          icon,
          width: 48,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: pDetailTextStyle.copyWith(fontSize: 12),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              keterangan,
              style: pSkyBlueTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
        Spacer(),
        Text(
          biaya,
          overflow: TextOverflow.ellipsis,
          style: pDetailTextStyle.copyWith(fontWeight: semiBold),
        ),
      ],
    ),
  );
}
