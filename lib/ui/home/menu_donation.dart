import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peduly_app/utils/const_value.dart';
import 'package:peduly_app/widgets/commons/shimmer_loading.dart';

final List<String> donationTitles = [
  'Donasi Rutin',
  'Donasi Barang',
  'Relawan',
  'Zakat',
  'Qurban',
  'Donasi Rutin',
  'Donasi Barang',
  'Zakat',
];
List<Color> backgroundcolors = [
  Colors.white,
  Colors.redAccent,
  Colors.pink,
  Colors.white,
  Colors.redAccent,
  Colors.pink,
  Colors.white,
  Colors.redAccent,
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

Widget buildMenuDonation(bool isLoading) {
  return ShimmerLoading(
    isLoading: isLoading,
    child: Container(
      height: 110,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: isLoading
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: donationTitles.length,
          itemBuilder: (context, index) {
            return _donationItem(donationTitles[index], donationImage[index],
                index, backgroundcolors[index]);
          }),
    ),
  );
}

Widget _donationItem(String title, String imagePath, int index, Color bgcolor) {
  EdgeInsets marginItem;

  if (index == 0) {
    marginItem = EdgeInsets.only(right: 8, left: 20, top: 6, bottom: 6);
  } else if (index == donationTitles.length - 1) {
    marginItem = EdgeInsets.only(left: 8, right: 16, top: 6, bottom: 6);
  } else {
    marginItem = EdgeInsets.symmetric(horizontal: 8, vertical: 6);
  }

  return Center(
    child: Container(
      margin: marginItem,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: bgcolor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 1,
                    offset: Offset(0.5, 0.5))
              ],
            ),
            child: SvgPicture.asset(
              imagePath,
              height: 30,
              width: 30,
              color: bgcolor == Colors.white ? Colors.redAccent : Colors.white,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          SizedBox(
            width: 60,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
