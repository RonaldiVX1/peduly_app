import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:peduly_app/widgets/theme/theme_weight.dart';

Widget buildDonatorTotal(
    {@required int donaturTotal, @required int dayRemaining}) {
  List<String> image = [
    "assets/image_person1.png",
    "assets/image_person2.png",
    "assets/image_person3.png",
    "assets/image_person4.png",
    "assets/image_person5.png",
  ];
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ImageStack(
            imageSource: ImageSource.Asset,
            imageList: image,
            totalCount: 0,
            backgroundColor: pWhiteColor,
            imageBorderColor: pSecondGreyColor,
            imageRadius: 30,
            imageCount: 5,
            showTotalCount: false),
        SizedBox(
          width: 4,
        ),
        Text(donaturTotal.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
        Text(
          " +",
          style: pPrimaryTextStyle.copyWith(fontWeight: semiBold),
        ),
        Spacer(),

        // Text(' Donatur',
        //     style: TextStyle(
        //       fontSize: 12,
        //       color: Colors.black87,
        //       fontWeight: FontWeight.normal,
        //     )),
        // RichText(
        //   text: TextSpan(
        //       text: donaturTotal.toString(),
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 14,
        //         fontWeight: FontWeight.w600,
        //       ),
        //       children: [
        //         TextSpan(
        //             text: ),
        //       ]),
        // ),
        Row(
          children: [
            Image.asset(
              "assets/icon_time_pause.png",
              width: 16,
            ),
            SizedBox(
              width: 4,
            ),
            RichText(
              text: TextSpan(
                  text: dayRemaining.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                        text: ' hari lagi',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        )),
                  ]),
            ),
          ],
        ),
      ],
    ),
  );
}
