import 'package:flutter/material.dart';

class GalangDanaPage extends StatelessWidget {
  Widget header() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }

  Widget content(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Galang Dana',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Galang dana untuk...',
            style: TextStyle(
              color: Color(0xff717171),
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          _pilihanGalangdana(
              title: 'Medis & Kesehatan',
              text: 'Khusus biaya pengobatan atau perawatan penyakit tertentu.',
              textbutton: 'Galang dana untuk Medis & Kesehatan',
              onTap: () {
                Navigator.pushNamed(context, '/buat_galang_dana');
              }),
          SizedBox(
            height: 25,
          ),
          _pilihanGalangdana(
              title: 'Umum dan Bantuan Lainya',
              text:
                  'Untuk umum seperti pendidikan, kemanusiaan, dan bencana alam, dsb',
              textbutton: 'Galang dana untuk Umum dan Lainnya',
              onTap: () {
                Navigator.pushNamed(context, '/buat_galang_dana');
              }),
        ],
      ),
    );
  }

  Widget _pilihanGalangdana(
      {@required String title,
      @required String text,
      @required String textbutton,
      @required Function() onTap}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      height: 180,
      width: 375,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffC4C4C4),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff717171),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Color(0xffE7513B),
                      )),
                  child: Text(
                    textbutton,
                    style: TextStyle(
                        color: Color(0xffE7513B),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: content(context),
    );
  }
}
