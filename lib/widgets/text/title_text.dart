import 'package:flutter/material.dart';
import 'package:peduly_app/widgets/commons/shimmer_loading.dart';

Widget titleText({String title, bool isLoading}) {
  if (isLoading) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: Container(
        width: 150,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  } else {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 16, top: 26),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}
