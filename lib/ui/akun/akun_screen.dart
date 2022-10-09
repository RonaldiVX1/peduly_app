// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:peduly_app/ui/akun/models/DetailUser.dart';
import 'package:peduly_app/ui/akun/pengaturan/pengaturan_screen.dart';
import 'package:peduly_app/ui/akun/riwayatdonasi/riwayat_donasi_screen.dart';
import 'package:peduly_app/ui/akun/ubahprofil/ubah_profil_screen.dart';
import 'package:peduly_app/ui/home/home.dart';
import 'package:peduly_app/utils/const_value.dart';
import 'package:peduly_app/widgets/buttons/peduly_grey_button.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:peduly_app/widgets/theme/theme_weight.dart';

class AkunScreen extends StatefulWidget {
  var isPengingatDonasi = false;
  var isTunaikanZakat = false;

  @override
  _AkunScreenState createState() => _AkunScreenState();
}

class _AkunScreenState extends State<AkunScreen> {
  User get user => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildProfileSection(),
        Divider(
          thickness: 2,
          color: Colors.grey[300],
        ),
        _buildSettingList(),
      ],
    );
  }

  Widget _buildProfileSection() {
    return FutureBuilder<User>(
        future: User.fetchUser(),
        builder: (context, orang) {
          if (orang.connectionState == ConnectionState.done) {
            return _testProfile(orang.data.name, orang.data.tipeUser);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _testProfile(String name, String tipeUser) {
    return Column(
      children: [
        SizedBox(
          height: 56,
        ),
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/profile_Image.png'),
          backgroundColor: Colors.transparent,
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          name ?? "Nama User",
          style: pBlackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
        ),
        Text(tipeUser ?? "Pribadi"),
        SizedBox(
          height: 24,
        ),
        _topUp(),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }

  Widget _topUp() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              blurRadius: 8,
              offset: Offset(0, 1))
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Image.asset(
                  'assets/wallet.png',
                  width: 48,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp. 0',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Isi saldo dompet',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff717171),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              side: BorderSide(
                color: Color(0xffE7513B),
                width: 2,
              ),
              primary: Color(0xffE7513B),
            ),
            onPressed: () {},
            child: Text(
              'Top up',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSettingList() {
    return Column(
      children: [
        _itemSettingSwitch(
            onTap: () {
              Navigator.pushNamed(context, '/pengingat_donasi');
            },
            text: 'Pengingat Donasi',
            value: widget.isPengingatDonasi,
            onToggle: (value) {
              setState(() {
                widget.isPengingatDonasi = value;
              });
            },
            icon: SvgPicture.asset(IC_TIMER)),
        Divider(),
        _itemSettingSwitch(
            onTap: () {},
            text: 'Tunaikan Zakat',
            value: widget.isTunaikanZakat,
            onToggle: (value) {
              setState(() {
                widget.isTunaikanZakat = value;
              });
            },
            icon: SvgPicture.asset(IC_DOLLAR_CIRCLE)),
        Divider(
          thickness: 2,
        ),
        _itemSetting(
            title: 'Galang Dana',
            icon: SvgPicture.asset(IC_DOCUMENT_FAVORITE),
            onTap: () {
              Navigator.pushNamed(context, '/galang_dana_main');
            }),
        Divider(
          thickness: 2,
          color: Colors.grey[300],
        ),
        // end of first section
        _itemSetting(
            title: 'Ubah Profil',
            icon: SvgPicture.asset(IC_UBAH_PROFILE),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => UbahProfileScreen()));
            }),
        _itemSetting(
            title: 'Pengaturan',
            icon: SvgPicture.asset(IC_SETTING),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PengaturanScreen()));
            }),
        Divider(),
        _itemSetting(
            title: 'Bantuan',
            icon: SvgPicture.asset(IC_MESSAGE_QUESTION),
            onTap: () {
              Navigator.pushNamed(context, '/bantuan');
            }),
        Divider(),
        _itemSetting(
            title: 'Tentang Peduly',
            icon: SvgPicture.asset(IC_ALERT_CIRCLE),
            onTap: () {
              Navigator.pushNamed(context, '/tentang_peduly');
            }),
        Divider(),
        _itemSetting(
            title: 'Syarat dan Ketentuan',
            icon: SvgPicture.asset(IC_BOOK_SQUARE),
            onTap: () {
              Navigator.pushNamed(context, '/syarat_dan_ketentuan');
            }),
        Divider(
          height: 0,
        ),
        _itemSetting(
            title: 'Ada yang baru',
            icon: SvgPicture.asset(IC_ADA_YANG_BARU),
            onTap: () {
              Navigator.pushNamed(context, '/ada_yang_baru');
            }),
        Container(
          color: Colors.grey[300],
          padding: const EdgeInsets.all(20),
          child: Row(children: [
            Text(
              'Peduly 1.0',
              style: TextStyle(fontSize: 12, color: Color(0xffB7B7B7)),
            ),
          ]),
        ),
        Divider(
          height: 0,
        ),
      ],
    );
  }

  Widget _itemSetting(
      {@required String title,
      @required SvgPicture icon,
      @required Function() onTap}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 14),
      ),
      minLeadingWidth: 0,
      horizontalTitleGap: 10,
      leading: icon,
      trailing: SvgPicture.asset(IC_ARROW_RIGHT),
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      onTap: onTap,
    );
  }

  Widget _itemSettingSwitch({
    @required String text,
    @required bool value,
    @required Function(bool) onToggle,
    @required SvgPicture icon,
    @required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
            Spacer(),
            FlutterSwitch(
              value: value,
              onToggle: onToggle,
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
              inactiveSwitchBorder: Border.all(width: 1, color: Colors.black26),
            ),
          ],
        ),
      ),
    );
  }
}
