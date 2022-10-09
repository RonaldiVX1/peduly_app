import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peduly_app/ui/main_screen.dart';
import 'package:peduly_app/utils/const_value.dart';
import 'package:peduly_app/widgets/toggle/toggle_options.dart';

class SuksesPembayaranScreen extends StatefulWidget {
  // const SuksesPembayaranScreen({ Key? key }) : super(key: key);
  var _isAnonimDonation = false;
  static const routeName = "/suksesPembayaran";

  @override
  _SuksesPembayaranScreenState createState() => _SuksesPembayaranScreenState();
}

class _SuksesPembayaranScreenState extends State<SuksesPembayaranScreen> {
  @override
  bool isSwitched = false;

  Widget _bolatanggal(String numb) {
    return Container(
      width: 30.0,
      height: 30.0,
      decoration: new BoxDecoration(
        color: Color(0xffE4E4E4),
        shape: BoxShape.circle,
      ),
      child: Center(child: Text(numb)),
    );
  }

  Widget _devider() {
    Container(
      //  width: MediaQuery.of(context).size.width*0.8,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey[300],
            width: 3.0,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: 1000,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SvgPicture.asset(TRANSACTION_SUCCESS),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Tetap jadi orang baik ya",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Terima kasih karena telah melakukan donasi.\nSemoga rezeki dan urusanmu semakin mudah",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                  SizedBox(
                    height: 38,
                  ),
                  Divider(
                    height: 1,
                    thickness: 3,
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Text(
                    "Donasimu minggu ini",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("SEN", style: TextStyle(color: Color(0xffE7513B))),
                        Text("SEL"),
                        Text("RAB"),
                        Text("KAM"),
                        Text("JUM"),
                        Text("SAB"),
                        Text("MIN"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: new BoxDecoration(
                            border: Border.all(
                              color: Color(
                                  0xffE7513B), //                   <--- border color
                              width: 1.0,
                            ),
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Text("18",
                                  style: TextStyle(color: Color(0xffE7513B)))),
                        ),
                        _bolatanggal("19"),
                        _bolatanggal("20"),
                        _bolatanggal("21"),
                        _bolatanggal("22"),
                        _bolatanggal("23"),
                        _bolatanggal("24"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  // _devider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                  SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: toggleOptions(
                        icon: Icons.timer_sharp,
                        text: "Pengingat Donasi",
                        value: isSwitched,
                        onToggle: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        }),
                  ),
                  SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                  SizedBox(
                    height: 38,
                  ),
                  InkWell(
                                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffE7513B),
                        ),
                        child: Center(
                            child: Text(
                          "Ke Halaman Utama",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MainScreen(),
                      ));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
