import 'package:flutter/material.dart';

Widget networkImageWithLoading({String url, double height, double width}) {
  return Image.network(
    url,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;
      return Center(
        child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null),
      );
    },
    fit: BoxFit.fill,
    height: height,
    width: width,
  );
}
