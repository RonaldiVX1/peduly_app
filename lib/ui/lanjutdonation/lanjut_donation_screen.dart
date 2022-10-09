import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peduly_app/data/model/instruksi_data.dart';
import 'package:peduly_app/data/model/test.dart';
import 'package:peduly_app/ui/lanjutdonation/instruksipembayaran/instruksi_pembayaran_screen.dart';
import 'package:peduly_app/ui/lanjutdonation/instruksipembayaran/sukses_pembayaran_screen.dart';
import 'package:peduly_app/ui/lanjutdonation/widget/kode_referal.dart';
import 'package:peduly_app/ui/lanjutdonation/widget/menggunakan_referal.dart';
import 'package:peduly_app/ui/lanjutdonation/widget/toggleOptionsReferal.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';
import 'package:peduly_app/widgets/items/donation_nominal_item.dart';
import 'package:peduly_app/widgets/toggle/toggle_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'metodepembayaran/metode_pembayaran_screen.dart';
import 'widget/metode_pembayaran_selected.dart';

class LanjutDonationScreen extends StatefulWidget {
  int selectedIndex;
  bool itemSelected = false;
  bool methodIsSelected = false;
  bool anonim = false;
  bool anonimRef = false;
  String imageUrl;
  String name;
  String methodName = "Metode Pembayaran";
  String va_number;
  final TextEditingController _nominal = TextEditingController();

  LanjutDonationScreen({this.donation});

  static const routeName = "/lanjutDonation";

  final Bencana donation;

  final controller = TextEditingController();

  var nominal = [10000, 20000, 50000];

  @override
  _LanjutDonationScreenState createState() => _LanjutDonationScreenState();
}

class _LanjutDonationScreenState extends State<LanjutDonationScreen> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: Container(
            child: Stack(
              children: [
                // Image.network(
                //   widget.donation.imageUrl,
                //   fit: BoxFit.fill,
                //   height: screen.height * 0.5,
                // ),
                Image.asset('assets/anakkorbanperahu.jpeg',
                    fit: BoxFit.cover, height: screen.height * 0.4),
                DraggableScrollableSheet(
                    maxChildSize: 1,
                    minChildSize: 0.75,
                    initialChildSize: 1,
                    builder: (context, controller) =>
                        _buildContent(controller)),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Color(0xffDDDDDD),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.symmetric(horizontal: 33, vertical: 13),
          child: pedulyButton(
              context: context,
              text: "Donasi",
              isEnabled:
                  widget._nominal.text.isNotEmpty && widget.imageUrl != null
                      ? true
                      : false,
              onPressed: () async {
                _onLoading();
                Navigator.pushNamed(
                    context, InstruksiPembayaranScreen.routeName,
                    arguments: InstruksiData(
                        imageUrl: widget.imageUrl,
                        nominal: widget._nominal.text,
                        methodName: widget.methodName,
                        va: await pembayaran()));
              }),
        )
      ],
    );
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 16,
                ),
                Text("Loading"),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String> pembayaran() async {
    var random = new Random();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString("nominal", _nominal);
    print("TOKEN : " + prefs.getString('login').toString());
    final response = await http.get(
      // final response = await http.post(
      Uri.parse("http://api.peduly.com/api/user"),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ' + prefs.getString('login'),
      },
    );
    print(response.body);
    var responseJson = jsonDecode(response.body);
    var userData = (responseJson as Map<String, dynamic>)['user'];
    print(userData);

    // await prefs.setString("username", responseJson["name"]);
    print(responseJson["user"]["name"]);
    var nomor = random.nextInt(900000) + 100000;
    print(nomor);

    Map<String, String> requestBody = <String, String>{
      'idCampaign': widget.donation.id,
      'nominalDonasi': widget._nominal.value.text,
      'email': responseJson["user"]["email"],
      // 'email': 'alwanfauzi13@gmail.com',
      'nama': responseJson["user"]["name"],
      // 'nomorHp': responseJson["user"]["no_telp"],
      'nomorHp': nomor.toString(),
      'payment_method': 'bank_transfer',
      'namaBank': widget.name,
    };
    // multipartRequest.headers.addAll(headers);
    var request = http.MultipartRequest(
        'POST', Uri.parse("https://api.peduly.com/api/payment/submit"))
      ..fields.addAll(requestBody);

    var getResponse = await request.send();
    final respStr = await getResponse.stream.bytesToString();
    var body = jsonDecode(respStr);
    print(body);
    String vaResult;

    if (widget.methodName == "Mandiri Bill") {
      vaResult = body["result"]["bill_key"];
    } else {
      vaResult = body["result"]["va_numbers"][0]["va_number"];
    }

    print(vaResult);

    return vaResult;
  }

  Widget _buildContent(ScrollController controller) {
    return Container(
      margin: EdgeInsets.only(top: 120),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white),
      child: SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black26,
                ),
                width: 30,
                height: 4,
              ),
            ),
            SizedBox(height: 29.0),
            Center(
              child: Text(
                "Masukkan Nominal Donasi",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffF2F2F2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rp",
                    style: TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.normal),
                  ),
                  Expanded(
                    child: TextField(
                      showCursor: true,
                      controller: widget._nominal,
                      cursorColor: Colors.black45,
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      style: TextStyle(
                          color: Colors.deepOrange[800],
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal),
                      decoration:
                          InputDecoration.collapsed(hintText: 'Nominal'),
                      onChanged: (value) => {widget.selectedIndex = -1},
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Minimal nominal donasi adalah 10.000",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Color(0xffC4C4C4)),
              ),
            ]),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                donationNominalItem(
                    nominal: widget.nominal[0],
                    color: widget.selectedIndex == 0
                        ? Color(0xffE7513B)
                        : Colors.black26,
                    onPressed: () {
                      setState(
                        () {
                          widget._nominal.text = widget.nominal[0].toString();
                          widget.selectedIndex = 0;
                          widget.itemSelected = true;
                        },
                      );
                    }),
                SizedBox(
                  width: 16,
                ),
                donationNominalItem(
                    nominal: widget.nominal[1],
                    color: widget.selectedIndex == 1
                        ? Color(0xffE7513B)
                        : Colors.black26,
                    onPressed: () {
                      setState(
                        () {
                          widget._nominal.text = widget.nominal[1].toString();
                          widget.selectedIndex = 1;
                          widget.itemSelected = true;
                        },
                      );
                    }),
                SizedBox(
                  width: 16,
                ),
                donationNominalItem(
                  nominal: widget.nominal[2],
                  color: widget.selectedIndex == 2
                      ? Color(0xffE7513B)
                      : Colors.black26,
                  onPressed: () {
                    setState(
                      () {
                        widget._nominal.text = widget.nominal[2].toString();
                        widget.selectedIndex = 2;
                        widget.itemSelected = true;
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Divider(
              color: Colors.black26,
              height: 1,
              thickness: 1,
            ),
            widget.anonimRef == false
                ? metodePembayaranSelected(
                    methodName: widget.methodName,
                    imageUrl: widget.imageUrl,
                    onPressed: () {
                      _navigateAndDisplaySelection(context);
                    },
                  )
                : menggunakanReferal(),
            Divider(
              color: Colors.black26,
              thickness: 1,
              height: 1,
            ),
            SizedBox(
              height: 16,
            ),
            toggleOptions(
                text: "Sembunyikan nama saya (anonim)",
                value: widget.anonim,
                onToggle: (value) {
                  setState(() {
                    widget.anonim = value;
                  });
                }),
            SizedBox(
              height: 25,
            ),
            Divider(
              color: Colors.black26,
              thickness: 1,
              height: 1,
            ),
            SizedBox(
              height: 24,
            ),

            //Kode referal
            toggleOptionsReferal(
              value: widget.anonimRef,
              onToggle: (value) {
                setState(() {
                  widget.anonimRef = value;
                });
              },
              text: "Masukkan kode referensi (opsional)",
            ),

            SizedBox(
              height: 24,
            ),
            Divider(
              color: Colors.black26,
              thickness: 1,
              height: 1,
            ),
            SizedBox(height: 24),

            Row(children: [
              Text("Tulis pesan atau doa baik (opsional)"),
            ]),
            SizedBox(height: 16),
            Container(
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
            SizedBox(
              height: 24,
            ),
          ]),
        ),
      ),
    );
  }

  void _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => MetodePembayaranScreen()),
    );

    setState(() {
      widget.imageUrl = result == null ? widget.imageUrl : result['imageUrl'];
      widget.methodName =
          result == null ? widget.methodName : result['methodName'];
      widget.name = result == null ? widget.name : result['name'];
    });
  }
}
