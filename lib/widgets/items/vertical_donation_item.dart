import 'package:flutter/material.dart';
import 'package:peduly_app/ui/detail/detail_donation_screen.dart';
import 'package:peduly_app/data/model/test.dart';
import 'package:peduly_app/utils/formatter.dart';

Widget verticalDonationItem(
    {@required BuildContext context,
    @required Bencana donation,
    @required String nominal}) {
  Size screen = MediaQuery.of(context).size;
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailDonationScreen(
                    donation: donation,
                    nominal: nominal,
                  )));
    },
    child: Container(
      width: screen.width * 1,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.asset(
                      'assets/anakkorbanperahu.jpeg',
                      fit: BoxFit.cover,
                      height: screen.height * 0.15,
                      width: screen.width * 0.55,
                    )
                    // Image.asset("assets/blank.jpg"),
                    // child: Image.network(
                    //   'https://api.peduly.com/images/images_campaign/' +
                    //       donation.imageUrl,
                    //   errorBuilder: (BuildContext context, Object exception,
                    //       StackTrace stackTrace) {
                    //     return Image(image: AssetImage('assets/blank.jpg'));
                    //   },
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
                    //   width: 180,
                    //   height: 120,
                    // ),
                    ),
              ),
            ),
          ),
          Flexible(
              fit: FlexFit.loose, child: _buildDataSection(donation, nominal))
        ],
      ),
    ),
  );
}

Widget _buildDataSection(Bencana donation, String nom) {
  nom = "30";
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
        child: Text(
          donation.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
        child: _buildAccountSection(donation),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 12.0, left: 12, right: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: LinearProgressIndicator(
            color: Color.fromARGB(255, 231, 81, 59),
            backgroundColor: Colors.black38,
            value: getPercentFromTotalAndDonationTarget(
                total: int.parse(donation.targetTotal),
                target: Nominal(int.parse(nom))),
          ),
        ),
      ),
      _buildCounterSection(donation, nom)
    ],
  );
}

Widget _buildAccountSection(Bencana donation) {
  return Container(
    child: Row(
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
    ),
  );
}

Widget _buildCounterSection(Bencana donation, String nom) {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        'Rp ${formatNumberToThousandAsString(Nominal(int.parse(nom)))}',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
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
                    text: TimeRemain(donation.dayRemaining).toString(),
                    // text: "",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.black))
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Nominal(int num) {
  if (num != null) {
    return num;
  } else {
    return 0;
  }
}
