import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/donation.dart';
// import 'package:peduly_app/widgets/items/vertical_donation_item.dart';

Widget buildVerticalDonationList(
    {@required BuildContext context,
    @required bool isLoading,
    @required List<Donation> listDonation}) {
  return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          // verticalDonationItem(context: context, donation: listDonation[0]),
          // Divider(
          //   height: 1,
          //   color: Colors.black45,
          // ),
          // verticalDonationItem(context: context, donation: listDonation[1]),
          // Divider(
          //   height: 1,
          //   color: Colors.black45,
          // ),
          // verticalDonationItem(context: context, donation: listDonation[2]),
        ],
      ));
}