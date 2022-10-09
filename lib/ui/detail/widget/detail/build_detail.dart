import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class BuildDetailDonation extends StatefulWidget {
  const BuildDetailDonation({Key key, @required this.detailDonation})
      : super(key: key);
  final String detailDonation;
  @override
  _BuildDetailDonationState createState() => _BuildDetailDonationState();
}

class _BuildDetailDonationState extends State<BuildDetailDonation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        widget.detailDonation,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black45,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
