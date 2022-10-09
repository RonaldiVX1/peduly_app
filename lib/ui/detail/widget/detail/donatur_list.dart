import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/donation.dart';
import 'package:peduly_app/widgets/buttons/peduly_button_border_small.dart';

class DonaturList extends StatefulWidget {
  int itemCount = 3;
  bool isExpanded = false;

  @override
  _DonaturListState createState() => _DonaturListState();
}

class _DonaturListState extends State<DonaturList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          height: widget.isExpanded ? 67.5 * listDonation.length : 500,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount:
                widget.isExpanded ? listDonation.length : widget.itemCount,
            itemBuilder: (BuildContext context, int index) {
              Donation donatur = listDonation[index];
              return Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 12, 12),
                    child: CircleAvatar(
                      backgroundColor: Color.fromRGBO(231, 81, 59, .4),
                      child: Icon(
                        Icons.person_outline,
                        color: Color.fromRGBO(231, 81, 59, 1),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        donatur.title,
                        style: TextStyle(
                          color: Color.fromRGBO(231, 81, 59, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Donasi Rp ${donatur.currentTotal}",
                      ),
                      Text(
                        donatur.dayRemaining.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
        PedulyButtonCornerSmall(
          text: widget.isExpanded ? "Lihat sedikit" : "Lihat Semua",
          onPressed: () {
            setState(
              () {
                !widget.isExpanded
                    ? widget.isExpanded = true
                    : widget.isExpanded = false;
              },
            );
          },
        ),
      ],
    );
  }
}
