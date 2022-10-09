import 'package:flutter/material.dart';
import 'package:peduly_app/ui/login/login.dart';
import 'package:peduly_app/widgets/appbars/back_appbar_menu_widget.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';
import 'package:peduly_app/widgets/text/title_text.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:peduly_app/widgets/theme/theme_weight.dart';

class ResetPasswordSuccessScreen extends StatelessWidget {
  static const routeName = '/resetPasswordSuccess';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 28,
              ),
              backAppBarMenuWidget(context: context),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),

              // _buildResetPasswordSuccessBody(),
              Text(
                'Selamat',
                style: pDetailTextStyle.copyWith(
                    fontSize: 32, fontWeight: semiBold),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                "Akunmu sudah bisa digunakan kembali",
                style: TextStyle(color: Color(0xffadadad)),
              ),
              SizedBox(
                height: 142,
              ),

              pedulyButton(
                  context: context,
                  text: 'Ke Halaman Utama',
                  isEnabled: true,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        LoginScreen.routeName, (Route<dynamic> route) => false);
                  }),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResetPasswordSuccessBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 140, 8, 0),
          child: Image.asset(
            'assets/mail_success.png',
            height: 150,
            width: 150,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Text(
            'Password berhasil direset',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Text(
            'Silahkan login dengan menekan tombol'
            '\nlogin dibawah ini',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
