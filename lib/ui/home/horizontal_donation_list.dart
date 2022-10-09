import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/donation.dart';
import 'package:peduly_app/widgets/commons/shimmer_loading.dart';
import 'package:peduly_app/widgets/items/horizontal_donation_item.dart';

Widget buildHorizontalDonationList(
    {@required bool isLoading, @required List<Donation> listDonation}) {
  return ShimmerLoading(
    isLoading: isLoading,
    child: Container(
      height: 365,
      margin: EdgeInsets.only(bottom: 38),
      child: ListView.builder(
          itemCount: listDonation.length,
          scrollDirection: Axis.horizontal,
          physics: isLoading
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var _donation = listDonation[index];
            EdgeInsets marginItem;
            if (index == 0) {
              marginItem = EdgeInsets.only(right: 8, left: 20);
            } else if (index == listDonation.length - 1) {
              marginItem = EdgeInsets.only(left: 8, right: 16);
            } else {
              marginItem = EdgeInsets.symmetric(horizontal: 8);
            }

            return Container(
                margin: marginItem,
                child: horizontalDonationItem(
                    context: context, donation: _donation));
          }),
    ),
  );
}
