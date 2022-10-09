import 'package:flutter/material.dart';
import 'package:peduly_app/utils/const_value.dart';
import 'package:peduly_app/widgets/commons/shimmer_loading.dart';

final List<String> dampakDonationTitles = [
  'Kisah sukses galang dana Kisah sukses galang dana',
  'Kisah sukses galang dana Kisah sukses galang dana',
  'Kisah sukses galang dana Kisah sukses galang dana',
  'Kisah sukses galang dana Kisah sukses galang dana',
  'Kisah sukses galang dana Kisah sukses galang dana',
  'Kisah sukses galang dana Kisah sukses galang dana',
  'Kisah sukses galang dana Kisah sukses galang dana',
  'Kisah sukses galang dana Kisah sukses galang dana',
];

final List<String> donationImage = [
  IC_RECEIPT_ITEM,
  IC_RECEIPT_ITEM,
  IC_RECEIPT_ITEM,
  IC_RECEIPT_ITEM,
  IC_RECEIPT_ITEM,
  IC_RECEIPT_ITEM,
  IC_RECEIPT_ITEM,
  IC_RECEIPT_ITEM
];

Widget dampakDonasi(bool isLoading) {
  return ShimmerLoading(
    isLoading: isLoading,
    child: Container(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: isLoading
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: dampakDonationTitles.length,
          itemBuilder: (context, index) {
            return _dampakDonasiItem(
                dampakDonationTitles[index], donationImage[index], index);
          }),
    ),
  );
}

Widget _dampakDonasiItem(String title, String imagePath, int index) {
  EdgeInsets marginItem;

  if (index == 0) {
    marginItem = EdgeInsets.only(right: 8, left: 20, top: 6, bottom: 6);
  } else if (index == dampakDonationTitles.length - 1) {
    marginItem = EdgeInsets.only(left: 8, right: 16, top: 6, bottom: 6);
  } else {
    marginItem = EdgeInsets.symmetric(horizontal: 8, vertical: 6);
  }

  return Center(
    child: Container(
      margin: marginItem,
      width: 170,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Image.asset('assets/dampak_donasi.png'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(
                    Icons.play_circle_outline_rounded,
                    size: 42,
                    color: Color(0xffE7513B),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
