import 'package:flutter/material.dart';
import 'package:peduly_app/utils/formatter.dart';

Widget buildCounterSection(
    {@required int currentTotal, @required int goalTotal}) {
  return Padding(
    padding: const EdgeInsets.only(left: 18, right: 20),
    child: LinearProgressIndicator(
      color: Color.fromARGB(255, 231, 81, 59),
      backgroundColor: Colors.black38,
      value: getPercentFromTotalAndDonationTarget(
          total: currentTotal, target: goalTotal),
    ),
  );
}
