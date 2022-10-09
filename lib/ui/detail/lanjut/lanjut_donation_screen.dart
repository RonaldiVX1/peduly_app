import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/donation.dart';

class LanjutDonationScreen extends StatefulWidget {
  static const routeName = "/lanjutDonation";
  const LanjutDonationScreen({Key key, @required this.donation})
      : super(key: key);
  final Donation donation;

  @override
  _LanjutDonationScreenState createState() => _LanjutDonationScreenState();
}

class _LanjutDonationScreenState extends State<LanjutDonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Stack(
      children: [
        // Image.network(
        //   widget.donation.imageUrl,
        //   fit: BoxFit.fill,
        //   height: screen.height * 0.5,
        // ),
        Container(
          height: screen.height * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      children: [],
    );
  }
}
