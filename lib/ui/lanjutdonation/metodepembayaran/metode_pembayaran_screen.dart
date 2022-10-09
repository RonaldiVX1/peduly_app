import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peduly_app/ui/lanjutdonation/widget/metode_pembayaran_divider.dart';
import 'package:peduly_app/widgets/appbars/back_to_named_button.dart';
import 'package:peduly_app/widgets/items/metode_pembayaran_item.dart';

class MetodePembayaranScreen extends StatefulWidget {
  static const routeName = "/metodePembayaran";

  @override
  _MetodePembayaranScreenState createState() => _MetodePembayaranScreenState();
}

class _MetodePembayaranScreenState extends State<MetodePembayaranScreen> {
  void _selectMethod(String name, String methodName, String imageUrl) {
    Navigator.of(context)
        .pop({'name': name, 'methodName': methodName, 'imageUrl': imageUrl});
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: Text(
          "Metode Pembayaran",
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildBody(screen),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(Size screen) {
    return Column(
      children: [_buildContent()],
    );
  }

  Widget _buildContent() {
    return Container(
      child: Column(
        children: [
          MetodePembayaranDivider(
              text:
                  "Virtual Account(verifikasi otomatis, minimal nominal Rp. 10000)"),
          metodePembayaranItem(
              imageUrl: "assets/bca.png",
              methodName: "BCA Virtual Account",
              onPressed: () {
                _selectMethod("bca", "BCA Virtual Account", "assets/bca.png");
              }),
          metodePembayaranItem(
              imageUrl: "assets/bni.png",
              methodName: "BNI Virtual Account",
              onPressed: () {
                _selectMethod("bni", "BNI Virtual Account", "assets/bni.png");
              }),
          metodePembayaranItem(
              imageUrl: "assets/mandiri.png",
              methodName: "Mandiri Bill",
              onPressed: () {
                _selectMethod("mandiri", "Mandiri Bill", "assets/mandiri.png");
              }),
          metodePembayaranItem(
              imageUrl: "assets/bri.png",
              methodName: "BRI Virtual Account",
              onPressed: () {
                _selectMethod("bri", "BRI Virtual Account", "assets/bri.png");
              }),
          // MetodePembayaranDivider(
          //     text:
          //         "Transfer bank (verifikasi manual 1x24 jam, minimal nominal Rp. 10.000)"),
          // metodePembayaranItem(
          //     imageUrl: "assets/bca.png",
          //     methodName: "Transfer BCA",
          //     onPressed: () {
          //       _selectMethod("Transfer BCA", "assets/bca.png");
          //     }),
          // metodePembayaranItem(
          //     imageUrl: "assets/bni.png",
          //     methodName: "Transfer BNI",
          //     onPressed: () {
          //       _selectMethod("Transfer BNI", "assets/bni.png");
          //     }),
          // metodePembayaranItem(
          //     imageUrl: "assets/mandiri.png",
          //     methodName: "Transfer Mandiri",
          //     onPressed: () {
          //       _selectMethod("Transfer Mandiri", "assets/mandiri.png");
          //     }),
          // metodePembayaranItem(
          //     imageUrl: "assets/bri.png",
          //     methodName: "Transfer BRI",
          //     onPressed: () {
          //       _selectMethod("Transfer BRI", "assets/bri.png");
          //     }),
          // MetodePembayaranDivider(
          //     text:
          //         "Kartu kredit (verifikasi otomatis, minimal nominal Rp. 10000"),
          // metodePembayaranItem(
          //     imageUrl: "assets/visa.png",
          //     methodName: "Credit Card",
          //     onPressed: () {}),
        ],
      ),
    );
  }
}
