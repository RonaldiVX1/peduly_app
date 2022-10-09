import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/riwayat_donation.dart';
import 'package:peduly_app/widgets/items/donation_history_item.dart';

class RiwayatDonasiScreen extends StatefulWidget {
  // static const routeName = "/riwayatDonasiScreen";

  // final String arrTitle;

  // const RiwayatDonasiScreen({Key key}) : super(key: key);
  //  const RiwayatDonasiScreen({Key key, this.arrTitle}) : super(key: key);

  @override
  _RiwayatDonasiScreenState createState() => _RiwayatDonasiScreenState();
}

class _RiwayatDonasiScreenState extends State<RiwayatDonasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Riwayat Donasi",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [_buildContent()],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 1000,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: riwayatDonationList.length,
            itemBuilder: (BuildContext context, int index) {
              RiwayatDonation donation = riwayatDonationList[index];
              return donationHistoryItem(context: context, donation: donation);
            },
          ),
        )
      ],
    );
  }
}
