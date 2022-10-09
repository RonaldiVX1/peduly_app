import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/donation.dart';
import 'package:peduly_app/data/model/test.dart';
import 'package:peduly_app/ui/lanjutdonation/lanjut_donation_screen.dart';

Widget buildFabDetailDonation(BuildContext context, Bencana donation) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildDonasiButton(() {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LanjutDonationScreen(
                    donation: donation,
                  )));
        }),
        _buildShareButton(() {})
      ],
    ),
  );
}

Widget _buildDonasiButton(Function() onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      width: 295,
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.deepOrange[800]),
      child: Center(
        child: InkWell(
          child: Text(
            'Donasi Sekarang',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    ),
  );
}

Widget _buildShareButton(Function() onPressed) {
  return SizedBox(
    height: 45,
    width: 45,
    child: FloatingActionButton(
      onPressed: onPressed,
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 252, 174, 3),
      child: Icon(Icons.share),
    ),
  );
}
