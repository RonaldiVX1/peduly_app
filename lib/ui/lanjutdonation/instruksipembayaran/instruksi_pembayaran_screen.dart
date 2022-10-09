import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peduly_app/data/model/donation.dart';
import 'package:peduly_app/data/model/instruksi_data.dart';
import 'package:peduly_app/ui/home/vertical_donation_list.dart';

class InstruksiPembayaranScreen extends StatefulWidget {
  InstruksiPembayaranScreen({@required this.instruksiData});

  final InstruksiData instruksiData;

  static const routeName = "/instruksiPembayaran";

  String dummy =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eu magna vel orci lobortis sagittis. Curabitur interdum dolor vel aliquam tincidunt. Vestibulum mollis facilisis vestibulum. Donec vitae nunc odio. Aliquam eget risus ultrices, iaculis elit sed, maximus justo. Maecenas at mauris nibh. In hac habitasse platea dictumst.";

  @override
  _InstruksiPembayaranScreenState createState() =>
      _InstruksiPembayaranScreenState();
}

class _InstruksiPembayaranScreenState extends State<InstruksiPembayaranScreen> {
  @override
  Widget build(BuildContext context) {
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
          "Donasi",
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
            children: [_buildBody()],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    Size screen = MediaQuery.of(context).size;
    return Column(
      children: [_buildContent()],
    );
  }

  Widget _buildContent() {
    final copiedSnackbar = SnackBar(
      content: Text('Copied to Clipboard'),
    );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 16,
          ),
          Center(
              child: Text(
            "Instruksi Pembayaran",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          )),
          SizedBox(
            height: 16,
          ),
          Center(
              child: Text(
            "Transfer sesuai nominal dibawah ini",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          )),
          SizedBox(
            height: 16,
          ),
          Center(
              child: Text(
            "Rp.${widget.instruksiData.nominal}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          )),
          SizedBox(
            height: 16,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: "Ke rekening ",
                style: TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(
                      text:
                          widget.instruksiData.methodName,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black))
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black12),
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[100]),
            child: ListTile(
              leading: Image(
                image: AssetImage(
                  widget.instruksiData.imageUrl,
                ),
                width: 40,
                height: 40,
              ),
              title: Center(
                  child: Text(widget.instruksiData.va,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18))),
              trailing: InkWell(
                child: Icon(Icons.copy_all_rounded),
                onTap: () => {
                  Clipboard.setData(
                          ClipboardData(text: widget.instruksiData.va))
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(copiedSnackbar);
                  })
                },
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: RichText(
                text: TextSpan(
                  text: "Transfer sebelum ",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                  children: [
                    TextSpan(
                        text: "04 Agustus 2021 16:24 ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black)),
                    TextSpan(
                        text:
                            "atau donasi kamu otomatis dibatalkan oleh sistem"),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          Divider(
            thickness: 4,
          ),
          SizedBox(height: 32),
          Center(
            child: Text(
              "Panduan Pembayaran",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ExpansionTile(
                  title: Text(
                    "BCA Mobile Banking (M-BCA)",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  collapsedTextColor: Colors.black,
                  textColor: Colors.black,
                  collapsedIconColor: Colors.black,
                  iconColor: Colors.black,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      child: Text(widget.dummy),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "BCA Internet Banking (KlikBCA)",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  collapsedTextColor: Colors.black,
                  textColor: Colors.black,
                  collapsedIconColor: Colors.black,
                  iconColor: Colors.black,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      child: Text(widget.dummy),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "ATM BCA",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  collapsedTextColor: Colors.black,
                  textColor: Colors.black,
                  collapsedIconColor: Colors.black,
                  iconColor: Colors.black,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      child: Text(widget.dummy),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          Divider(
            thickness: 4,
          ),
          SizedBox(height: 32),
          Center(
            child: Text(
              "Mari bantu yang lain",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Center(
              child: Text(
            "Transfer sesuai nominal dibawah ini",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: buildVerticalDonationList(
                context: context, isLoading: false, listDonation: listDonation),
          ),
        ],
      ),
    );
  }
}