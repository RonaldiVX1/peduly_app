import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FundraiserSection extends StatefulWidget {
  @override
  _FundraiserSectionState createState() => _FundraiserSectionState();
}

class _FundraiserSectionState extends State<FundraiserSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Center(child: SvgPicture.asset("assets/fundraiser.svg")),
          SizedBox(
            height: 24,
          ),
          Text(
            "Cara Lain Jadi Orang Baik",
            style: TextStyle(fontSize: 18, color: Colors.deepOrange, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
              "Kamu bisa bantu penggalangan dana ini supaya berhasil dengan menjadi fundraiser.", textAlign: TextAlign.center,),
          SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: (){},
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color(0xffE7513B)
                )
              ),
                 child: Center(child: Text("Jadi Fundraiser", style: TextStyle(
                   fontWeight: FontWeight.w700, color: Color(0xffE7513B), 
                 ),)),
            ),
          )
        ],
      ),
    );
  }
}
