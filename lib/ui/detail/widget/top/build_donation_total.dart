import 'package:flutter/material.dart';
import 'package:peduly_app/utils/formatter.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';

Widget buildDonationTotal(
    {@required int currentTotal, @required int goalTotal}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: RichText(
      text: TextSpan(
        text: 'Rp ${formatNumberToThousandAsString(currentTotal)}  ',
        style: TextStyle(
          color: pPrimaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
              text: 'terkumpul dari ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.normal,
              )),
          TextSpan(
              text: 'Rp ${formatNumberToThousandAsString(goalTotal)}',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black))
        ],
      ),
    ),
  );
}
