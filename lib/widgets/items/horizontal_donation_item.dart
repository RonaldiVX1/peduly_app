import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/donation.dart';
import 'package:peduly_app/utils/formatter.dart';

Widget horizontalDonationItem({BuildContext context, Donation donation}) {
  Size screen = MediaQuery.of(context).size;
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(0, 3), blurRadius: 6, color: Colors.black12),
        ]),
    width: screen.width * 0.525,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: Image.asset(
            'assets/anakkorbanperahu.jpeg',
            fit: BoxFit.fill,
            height: screen.height * 0.2,
            width: screen.width * 0.55,
          ),
          // Image.network(
          //   donation.imageUrl,
          //   loadingBuilder: (context, child, loadingProgress) {
          //     if (loadingProgress == null) return child;
          //     return Center(
          //       child: CircularProgressIndicator(
          //           value: loadingProgress.expectedTotalBytes != null
          //               ? loadingProgress.cumulativeBytesLoaded /
          //                   loadingProgress.expectedTotalBytes
          //               : null),
          //     );
          //   },
          //   fit: BoxFit.fill,
          //   height: screen.height * 0.2,
          //   width: screen.width * 0.55,
          // ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 12, 0),
          child: SizedBox(
            height: 40,
            child: Text(
              donation.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 12, 0),
          child: _buildAccountSection(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 20, right: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: LinearProgressIndicator(
              color: Color.fromARGB(255, 231, 81, 59),
              backgroundColor: Colors.black38,
              value: getPercentFromTotalAndDonationTarget(
                  total: donation.currentTotal, target: donation.targetTotal),
            ),
          ),
        ),
        _buildCounterSection(donation)
      ],
    ),
  );
}

Widget _buildAccountSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(right: 6),
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color.fromARGB(
            255,
            231,
            81,
            59,
          ),
        ),
      ),
      Text(
        'Peduly Surabaya',
        style: TextStyle(fontSize: 10),
      ),
      Container(
        margin: EdgeInsets.only(left: 6),
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color.fromARGB(255, 29, 161, 242),
        ),
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 8,
        ),
      ),
    ],
  );
}

Widget _buildCounterSection(Donation donation) {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0, left: 20, right: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: RichText(
            text: TextSpan(
              text: 'Terkumpul \n',
              style: TextStyle(color: Colors.black87),
              children: [
                TextSpan(
                    text:
                        'Rp ${formatNumberToThousandAsString(donation.currentTotal)}',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.black))
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: RichText(
            text: TextSpan(
              text: 'Sisa Hari \n',
              style: TextStyle(color: Colors.black87),
              children: [
                TextSpan(
                    text: '${donation.dayRemaining}',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.black))
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
