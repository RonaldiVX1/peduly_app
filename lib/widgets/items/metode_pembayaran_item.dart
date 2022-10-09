import 'package:flutter/material.dart';

Widget metodePembayaranItem({
  @required String imageUrl,
  @required String methodName,
  @required Function() onPressed,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      height: 65,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Image(
                  height: 40,
                  width: 40,
                  image: AssetImage(imageUrl),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(methodName),
              ),
            ],
          ),
          Divider()
        ],
      ),
    ),
  );
}
