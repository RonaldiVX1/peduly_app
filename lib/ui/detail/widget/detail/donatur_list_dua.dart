import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/doa.dart';
import 'package:peduly_app/data/model/donation.dart';
import 'package:peduly_app/widgets/buttons/peduly_button_border_small.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';

import '../../../../widgets/theme/theme_weight.dart';

class DonaturListDua extends StatefulWidget {
  int itemCount = 3;
  bool isExpanded = false;

  @override
  _DonaturListDuaState createState() => _DonaturListDuaState();
}

class _DonaturListDuaState extends State<DonaturListDua> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          height: widget.isExpanded ? 67.5 * listDonation.length : 500,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount:
                widget.isExpanded ? listDonation.length : widget.itemCount,
            itemBuilder: (BuildContext context, int index) {
              Donation donatur = listDonation[index];
              Doa doa = listDoa[index];
              return Padding(
                padding: EdgeInsets.only(top: 24),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(231, 81, 59, .4),
                        child: Icon(
                          Icons.person_outline,
                          color: Color.fromRGBO(231, 81, 59, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(doa.name,
                            style: pBlackSecondTextStyle.copyWith(
                                fontSize: 16, fontWeight: bold)),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Donasi Rp ${donatur.currentTotal}",
                          style: pBlackSecondTextStyle,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          donatur.dayRemaining.toString() + " hari yang lalu",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
        // PedulyButtonCornerSmall(
        //   text: widget.isExpanded ? "Lihat sedikit" : "Lihat Semua",
        //   onPressed: () {
        //     setState(
        //       () {
        //         !widget.isExpanded
        //             ? widget.isExpanded = true
        //             : widget.isExpanded = false;
        //       },
        //     );
        //   },
        // ),
      ],
    );
  }
}
