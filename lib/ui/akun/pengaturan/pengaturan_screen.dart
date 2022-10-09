import 'dart:io';
import 'package:flutter/material.dart';
import 'package:peduly_app/ui/akun/models/DetailUser.dart';
import 'package:peduly_app/ui/login/login.dart';
import 'package:peduly_app/widgets/buttons/peduly_button_border.dart';
import 'package:peduly_app/widgets/buttons/peduly_button_border_2.dart';
import 'package:peduly_app/widgets/buttons/peduly_button_border_small.dart';
import 'package:peduly_app/widgets/buttons/peduly_button_cancel_keluar.dart';
import 'package:peduly_app/widgets/buttons/peduly_button_keluar_1.dart';
import 'package:peduly_app/widgets/buttons/peduly_button_pengaturan_keluar.dart';
import 'package:peduly_app/widgets/buttons/peduly_button_small.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:peduly_app/widgets/theme/theme_weight.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PengaturanScreen extends StatefulWidget {
  // static const routeName = "/pengaturanScreen";

  var _isAnonimDonation = false;

  @override
  _PengaturanScreenState createState() => _PengaturanScreenState();
}

class _PengaturanScreenState extends State<PengaturanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Pengaturan",
          style: pBlackTextStyle.copyWith(
              fontWeight: semiBold, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          //Solving UI
          // _buildBodyContent(),

          //Consume API
          _buildContent(),
        ],
      ),
    );
  }

  //Solving UI
  // Widget _buildBodyContent() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       SwitchListTile(
  //         title: Text("Donasi sebagai Anonim"),
  //         value: widget._isAnonimDonation,
  //         onChanged: (value) {
  //           setState(() {
  //             widget._isAnonimDonation = value;
  //           });
  //         },
  //       ),

  //       // Divider(
  //       //   height: 10,
  //       //   color: Color(0xffE4E4E4),
  //       // ),
  //       Container(
  //         width: MediaQuery.of(context).size.width,
  //         height: 10,
  //         color: Color(0xffE4E4E4),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
  //         child: Text(
  //           "Akun Terhubung",
  //           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
  //         ),
  //       ),
  //       Container(
  //         width: MediaQuery.of(context).size.width,
  //         height: 1,
  //         color: Color(0xffE4E4E4),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(top: 9.0, bottom: 8),
  //         child: ListTile(
  //           title: Text('Google'),
  //           leading: Icon(
  //             Icons.email_outlined,
  //           ),
  //           // Image.asset("assets/google.png"),
  //           trailing: Text('Email'),
  //           // Text(orang.data != null ? orang.data.email : ""),
  //           contentPadding: EdgeInsets.symmetric(horizontal: 16),
  //         ),
  //       ),
  //       Container(
  //         width: MediaQuery.of(context).size.width,
  //         height: 3.5,
  //         color: Color(0xffE4E4E4),
  //       ),
  //       ListTile(
  //         title: Text('Ubah Password'),
  //         leading: Icon(Icons.lock_outline_sharp),
  //         // SvgPicture.asset("assets/ic_lock.svg"),
  //         trailing: Icon(Icons.chevron_right_rounded),
  //         contentPadding: EdgeInsets.symmetric(horizontal: 16),
  //       ),
  //       Container(
  //         width: MediaQuery.of(context).size.width,
  //         height: 3.5,
  //         color: Color(0xffE4E4E4),
  //       ),
  //       ListTile(
  //         title: Text(
  //           'Logout',
  //           style: TextStyle(
  //             color: Color(0xffE7513B),
  //           ),
  //         ),
  //         leading: Icon(Icons.logout),
  //         // SvgPicture.asset("assets/ic_book.svg"),
  //         trailing: Icon(Icons.chevron_right_rounded),
  //         contentPadding: EdgeInsets.symmetric(horizontal: 16),
  //         onTap: () => showDialog<String>(
  //           context: context,
  //           builder: (BuildContext context) => Center(
  //             child: Center(
  //               child: AlertDialog(
  //                 title: Center(child: const Text('Keluar dari Peduly App?')),
  //                 content: Container(
  //                     height: 99,
  //                     child: Column(
  //                       children: [
  //                         InkWell(
  //                           onTap: () => logout(),
  //                           child: Container(
  //                             height: 40,
  //                             width: MediaQuery.of(context).size.width * 0.6,
  //                             decoration: BoxDecoration(
  //                                 borderRadius:
  //                                     BorderRadius.all(Radius.circular(5)),
  //                                 color: Color(0xffE7513B)),
  //                             child: Center(
  //                                 child: Text(
  //                               'Keluar',
  //                               style: TextStyle(
  //                                   color: Colors.white, fontSize: 18),
  //                             )),
  //                           ),
  //                         ),
  //                         SizedBox(
  //                           height: 5,
  //                         ),
  //                         TextButton(
  //                           onPressed: () => Navigator.pop(context, 'Cancel'),
  //                           child: const Text(
  //                             'Batal',
  //                             style:
  //                                 TextStyle(color: Colors.black, fontSize: 18),
  //                           ),
  //                         ),
  //                       ],
  //                     )),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildContent() {
    return FutureBuilder(
        future: User.fetchUser(),
        builder: (context, orang) {
          if (orang.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: SwitchListTile(
                    title: Text(
                      "Donasi sebagai Anonim",
                      style: pBlackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    value: widget._isAnonimDonation,
                    onChanged: (value) {
                      setState(() {
                        widget._isAnonimDonation = value;
                      });
                    },
                  ),
                ),
                Divider(
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                ListTile(
                  title: Text("Ubah Kata Sandi",
                      style: pBlackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold)),
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    color: pGreyColor,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                Divider(
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                ListTile(
                    title: Text("Rekening",
                        style: pBlackTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold)),
                    trailing: Icon(Icons.chevron_right_rounded),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    onTap: () {
                      Navigator.pushNamed(context, '/rekening');
                    }),
                Divider(
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                _tileVerifikasiAkun(orang.data.status),
                Divider(
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(
                  height: 24,
                ),
                PedulyButtonPengaturanKeluar(
                    text: 'Keluar',
                    onPressed: () {
                      showBottomDialog(context);
                    }),
                // ListTile(
                //   title: Text(
                //     'Logout',
                //     style: TextStyle(
                //       color: Color(0xffE7513B),
                //     ),
                //   ),
                //   leading: Icon(Icons.logout),
                //   // SvgPicture.asset("assets/ic_book.svg"),
                //   trailing: Icon(Icons.chevron_right_rounded),
                //   contentPadding: EdgeInsets.symmetric(horizontal: 16),
                //   onTap: () => showDialog<String>(
                //     context: context,
                //     builder: (BuildContext context) => Center(
                //       child: Center(
                //         child: AlertDialog(
                //           title: Center(
                //               child: const Text('Keluar dari Peduly App?')),
                //           content: Container(
                //               height: 99,
                //               child: Column(
                //                 children: [
                //                   InkWell(
                //                     onTap: () => logout(),
                //                     child: Container(
                //                       height: 40,
                //                       width: MediaQuery.of(context).size.width *
                //                           0.6,
                //                       decoration: BoxDecoration(
                //                           borderRadius: BorderRadius.all(
                //                               Radius.circular(5)),
                //                           color: Color(0xffE7513B)),
                //                       child: Center(
                //                           child: Text(
                //                         'Keluar',
                //                         style: TextStyle(
                //                             color: Colors.white, fontSize: 18),
                //                       )),
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     height: 5,
                //                   ),
                //                   TextButton(
                //                     onPressed: () =>
                //                         Navigator.pop(context, 'Cancel'),
                //                     child: const Text(
                //                       'Batal',
                //                       style: TextStyle(
                //                           color: Colors.black, fontSize: 18),
                //                     ),
                //                   ),
                //                 ],
                //               )),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget showBottomDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: _buildDialogContent(),
        );
      },
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }

  Widget _buildDialogContent() {
    return IntrinsicHeight(
      child: Container(
        width: double.maxFinite,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Material(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Keluar Dari Peduly',
                style: pBlackTextStyle.copyWith(
                    fontSize: 18, fontWeight: semiBold),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  PedulyButtonCancelKeluar(
                      text: 'Batal',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  PedulyButtonKeluar1(
                      text: 'Keluar',
                      onPressed: () {
                        logout();
                      }),
                ],
              ),
              SizedBox(
                height: 24,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusAkun(String status) {
    if (status == 'Not Verified') {
      return _contentVerifikasiAkun(
        statusUser: 'Belum diajukan',
        textStyle: pSecondGreyTextStyle,
        color: pSecondGreyColor,
      );
    } else if (status == 'Diproses') {
      return _contentVerifikasiAkun(
        statusUser: 'Diproses',
        textStyle: pYellowTextStyle,
        color: pYellowColor,
      );
    } else if (status == 'Berhasil') {
      return _contentVerifikasiAkun(
        statusUser: 'Berhasil',
        textStyle: pGreenTextStyle,
        color: pGreenColor,
      );
    } else if (status == 'Ditolak') {
      return _contentVerifikasiAkun(
        statusUser: 'Ditolak',
        textStyle: pRedTextStyle,
        color: pRedColor,
      );
    } else {
      return _contentVerifikasiAkun(
        statusUser: 'gagal',
        textStyle: pBlackTextStyle,
        color: pBlackColor,
      );
    }
  }

  Widget _tileVerifikasiAkun(String status) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/verif_individu');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Text('Verifikasi Akun',
                style: pBlackTextStyle.copyWith(
                    fontSize: 16, fontWeight: semiBold)),
            Spacer(),
            _statusAkun(
              status,
            ),
          ],
        ),
      ),
    );
  }

  Widget _contentVerifikasiAkun(
      {String statusUser, TextStyle textStyle, Color color}) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: color, width: 1)),
            child: Text(
              statusUser,
              style: textStyle.copyWith(fontWeight: semiBold, fontSize: 10),
            )),
        Icon(
          Icons.chevron_right_rounded,
          color: pGreyColor,
        ),
      ],
    );
  }

  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("TOKEN : " + pref.getString('login').toString());
    print('Bearer ' + pref.getString('login'));
    final response = await http.post(
      Uri.parse("https://dev.peduly.com/api/auth/logout"),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ' + pref.getString('login'),
      },
    );
    print(response.body);
    print(response.statusCode);
    await pref.clear();
    print("TOKEN : " + pref.getString('login').toString());
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (dialogContex) => LoginScreen()),
        ModalRoute.withName("/LoginScreen"));
  }
}
