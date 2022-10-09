import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/riwayat_donation.dart';
import 'package:peduly_app/utils/formatter.dart';

Widget donationHistoryItem({
  @required BuildContext context,
  @required RiwayatDonation donation,
}) {
  Size screen = MediaQuery.of(context).size;
  return Column(
    children: [
      InkWell(
        child: Container(
          width: screen.width * 1,
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Center(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://via.placeholder.com/180',
                    fit: BoxFit.fill,
                    width: 150,
                    height: 110,
                  ),
                )),
              ),
              Flexible(fit: FlexFit.loose, child: _buildDataSection(donation))
            ],
          ),
        ),
      ),
      Divider(thickness: 1.5, color: Colors.grey[200],),
    ],
  );
}

Widget _buildDataSection(RiwayatDonation donation) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        donation.donationName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16, right: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              donation.donationDate,
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
            // SizedBox(width: 2),
            Text("Rp " +
                  formatNumberToThousandAsString(donation.donationNominal), style: TextStyle(fontSize: 12),),
          ],
        ),
      ),
      SizedBox(height: 16,),
      _buildDonationStatus(donation.donationStatus),
    ],
  );
}

Widget _buildDonationStatus(int status) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: getColor(status)),
        borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Text(
        getStatus(status),
        style: TextStyle(
          color: getColor(status),
        ),
      ),
    ),
  );
}

Color getColor(int status) {
  if (status == 0) {
    return Colors.grey;
  } else if (status == 1) {
    return Colors.red;
  } else if (status == 2) {
    return Colors.green;
  } else {
    return Colors.black;
  }
}

String getStatus(int status) {
  if (status == 0) {
    return "Dibatalkan";
  } else if (status == 1) {
    return "Pending";
  } else if (status == 2) {
    return "Berhasil";
  } else {
    return "Unknown";
  }
}
