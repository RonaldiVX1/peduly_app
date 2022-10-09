import 'package:flutter/material.dart';

class SelesaiDonasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget textHeader() {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 28,
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/arrow_left.png",
              width: 24,
            ),
            SizedBox(
              width: 10,
            ),
            Text("Pembayaran"),
          ],
        ),
      );
    }

    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: ListView(
        children: [
          textHeader(),
        ],
      ),
    ));
  }
}
