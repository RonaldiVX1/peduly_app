import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:peduly_app/data/model/instruksi_data.dart';
import 'package:peduly_app/ui/lanjutdonation/instruksipembayaran/instruksi_pembayaran_screen.dart';
import 'package:peduly_app/ui/lanjutdonation/metodepembayaran/metode_pembayaran_screen.dart';
import 'package:peduly_app/ui/lanjutdonation/widget/metode_pembayaran_selected.dart';
import 'package:peduly_app/ui/lanjutdonation/widget/reference_code.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';
import 'package:peduly_app/widgets/items/donation_nominal_item.dart';
import 'package:peduly_app/widgets/toggle/toggle_options.dart';

class TransferScreen extends StatefulWidget {
  TransferScreen({this.nominal});

  static const routeName = "/transferScreen";

  final TextEditingController _namaLengkap = TextEditingController();
  final TextEditingController _alamatDetail = TextEditingController();

  final int nominal;

  String imageUrl = "assets/bri.png";
  String methodName = "BRI Virtual Account";

  bool enabled = true;
  bool anonim = false;
  bool referensi = false;

  final controller = TextEditingController();

  bool isInputName = false;
  bool isInputEmail = false;

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.black,
          onPressed: () {},
        ),
        elevation: 0,
        title: Text(
          "Nominal Donasi",
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: pedulyButton(
          context: context,
          text: "Lanjut Donasi",
          isEnabled: widget.isInputName && widget.isInputEmail ? true : false,
          onPressed: () {
            // Navigator.pushNamed(
            //   context,
            //   InstruksiPembayaranScreen.routeName,P
            //   arguments: InstruksiData(
            //       imageUrl: widget.imageUrl,
            //       nominal: widget.nominal.toString(),
            //       methodName: widget.methodName),
            // );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildBody(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Column(
      children: [_buildContent()],
    );
  }

  void _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MetodePembayaranScreen()),
    );

    setState(() {
      widget.imageUrl = result == null ? widget.imageUrl : result['imageUrl'];
      widget.methodName =
          result == null ? widget.methodName : result['methodName'];
    });
  }

  Widget _buildContent() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 16,
          ),
          metodePembayaranSelected(
            methodName: widget.methodName,
            imageUrl: widget.imageUrl,
            onPressed: () {
              _navigateAndDisplaySelection(context);
            },
          ),
          SizedBox(
            height: 24,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                  text: "Login",
                  style: TextStyle(color: Colors.deepOrange[800]),
                  children: [
                    TextSpan(
                        text: " atau lengkapi data dibawah ini :",
                        style: TextStyle(color: Colors.black))
                  ]),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
            child: TextField(
              showCursor: true,
              controller: widget._namaLengkap,
              cursorColor: Colors.black45,
              enabled: widget.enabled,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black45,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Nama Lengkap',
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              onChanged: (text) {
                setState(() {
                  text.isEmpty
                      ? widget.isInputName = false
                      : widget.isInputName = true;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(24, 16, 24, 8),
            child: TextField(
              showCursor: true,
              controller: widget._alamatDetail,
              cursorColor: Colors.black45,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black45,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Alamat Email',
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              onChanged: (text) {
                setState(() {
                  text.isEmpty
                      ? widget.isInputEmail = false
                      : widget.isInputEmail = true;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: toggleOptions(
                text: "Sembunyikan nama (Anonim)",
                value: widget.anonim,
                onToggle: (value) {
                  setState(() {
                    widget.anonim = value;
                    widget.anonim
                        ? widget._namaLengkap.text = "Anonim"
                        : widget._namaLengkap.text = "";
                    value ? widget.enabled = false : widget.enabled = true;
                    value
                        ? widget.isInputName = true
                        : widget.isInputName = false;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          Container(
            height: !widget.referensi ? 60 : 90,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Row(
                children: [
                  !widget.referensi
                      ? Text(
                          "Kode Referensi (opsional)",
                        )
                      : referenceCode(controller: widget.controller),
                  Spacer(),
                  FlutterSwitch(
                    value: widget.referensi,
                    onToggle: (value) {
                      setState(() {
                        widget.referensi = value;
                      });
                    },
                    height: 30,
                    width: 50,
                    activeToggleColor: Colors.white,
                    activeToggleBorder:
                        Border.all(width: 1, color: Colors.deepOrange[800]),
                    activeColor: Colors.deepOrange[800],
                    inactiveColor: Colors.transparent,
                    toggleColor: Colors.black26,
                    activeSwitchBorder:
                        Border.all(width: 1, color: Colors.deepOrange[800]),
                    inactiveSwitchBorder:
                        Border.all(width: 1, color: Colors.black26),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              "Tulis pesan atau doa baik (opsional)",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black26),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  decoration: InputDecoration.collapsed(
                      border: InputBorder.none,
                      hintText:
                          "Tulis doa untuk penggalangan dana atau untuk diri kamu sendiri",
                      hintStyle: TextStyle(fontSize: 14)),
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  maxLength: 140,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
