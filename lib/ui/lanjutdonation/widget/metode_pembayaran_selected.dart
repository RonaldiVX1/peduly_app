import 'package:flutter/material.dart';
import 'package:peduly_app/widgets/buttons/peduly_button_small.dart';
import 'package:peduly_app/widgets/buttons/peduly_grey_button.dart';
import 'package:peduly_app/widgets/buttons/peduly_grey_button_2.dart';

Widget metodePembayaranSelected(
    {@required String methodName,
    String imageUrl,
    @required Function() onPressed}) {
  bool isEnabled = imageUrl != null ? true : false;

  return Container(
    height: 65,
    width: double.infinity,
    child: Row(
      children: [
        if (imageUrl != null) ...[
          Image(
            width: 40,
            height: 40,
            image: AssetImage(imageUrl),
          ),
        ],
        SizedBox(
          width: 16,
        ),
        Text(
          methodName,
          style: TextStyle(fontSize: 16),
        ),
        Spacer(),
        PedulyButtonSmall(
            text: imageUrl != null ? "Ganti" : "Pilih",
            onPressed: onPressed,
            isEnabled: isEnabled)
      ],
    ),
  );
}
