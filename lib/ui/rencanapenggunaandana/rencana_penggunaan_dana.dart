import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peduly_app/data/model/test.dart';
import 'package:peduly_app/ui/home/donation_list.dart';
import 'package:peduly_app/ui/rencanapenggunaandana/widget/detail_rencana_pengunaan_dana.dart';
import 'package:peduly_app/ui/rencanapenggunaandana/widget/divider.dart';
import 'package:peduly_app/widgets/appbars/back_to_named_button.dart';
import 'package:peduly_app/widgets/text/title_text.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:peduly_app/widgets/theme/theme_weight.dart';

class RencanaPenggunaanDana extends StatefulWidget {
  @override
  State<RencanaPenggunaanDana> createState() => _RencanaPenggunaanDanaState();
  final Bencana targetBantuan;
  RencanaPenggunaanDana(this.targetBantuan);
}

class _RencanaPenggunaanDanaState extends State<RencanaPenggunaanDana> {
  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'ID',
      symbol: 'Rp ',
    );

    final targetDonasi = int.parse(widget.targetBantuan.targetTotal);
    Widget targetDonationText() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              Text(
                "Target Donasi",
                style: pGreyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 7),
              Text(
                currencyFormat.format(targetDonasi),
                style: pPrimaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget contentAlokasiAnggaranText() {
      return Container(
        height: 88,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 39, vertical: 19),
        decoration: BoxDecoration(
          color: pYellowColor.withOpacity(0.14),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
            "Total target dan alokasi anggaran dapat berubah sesuai dengan kondisi dan kebutuhan selama proses penggalangan dana berlangsung"),
      );
    }

    Widget titleTextContent(String text) {
      return Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backToNamedButton(
                  text: "Rencana Penggunaan Dana",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              targetDonationText(),
              contentAlokasiAnggaranText(),
              SizedBox(
                height: 4,
              ),
              titleTextContent("Detail Perkiraan Biaya Pengeluaran"),
              detailRencanaPenggunaanDana(
                  "assets/icon_grey_biaya_rumah_sakit.png",
                  "Biaya Rumah Sakit",
                  "Keterangan biaya",
                  "Rp. 200.000.000"),
              divider(),
              detailRencanaPenggunaanDana(
                  "assets/icon_grey_biaya_rumah_sakit.png",
                  "Biaya Operasional Pasien",
                  "Keterangan biaya",
                  "Rp. 200.000.000"),
              divider(),
              detailRencanaPenggunaanDana(
                  "assets/icon_grey_operasional_pasien.png",
                  "Biaya Penunjang Pengobatan",
                  "Keterangan biaya",
                  "Rp. 200.000.000"),
              divider(),
              detailRencanaPenggunaanDana(
                  "assets/icon_grey_instagram.png",
                  "Biaya Iklan + PPN JLN",
                  "Keterangan biaya",
                  "Rp. 200.000.000"),
            ],
          ),
        ),
      ),
    );
  }
}
