import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peduly_app/ui/resetpassword/cekEmail.dart';
import 'package:peduly_app/ui/signup/signup.dart';
import 'package:peduly_app/widgets/appbars/back_appbar_menu_widget.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';

class ForgetPassScreen extends StatefulWidget {
  static const routeName = '/forgetPassword';

  @override
  _ForgetPassScreenState createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final TextEditingController _forgetEmailController = TextEditingController();

  resetPass() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _forgetEmailController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.deepOrange[800],
            content: Text(
              'Email telah terkirim!',
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            )),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CekEmailScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.deepOrange[800],
              content: Text(
                'User email tidak ditemukan!',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              )),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              backAppBarMenuWidget(context: context),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 25, 8, 10),
                child: Image.asset(
                  'assets/pos.png',
                  height: 100,
                  width: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(
                  'Lupa Password?',
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
                  'Masukkan email agar kami mengirimkan email'
                  '\nintruksi untuk reset passwordmu',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 24),
                child: TextField(
                  showCursor: true,
                  controller: _forgetEmailController,
                  cursorColor: Colors.black45,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black45,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Masukkan Email',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
                ),
              ),
              pedulyButton(
                context: context,
                text: 'Kirim Instruksi',
                isEnabled: true,
                onPressed: () async {
                  resetPass();
                },
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun?',
                    style: TextStyle(
                      fontSize: 17,
                      color: pGreyColor,
                      fontWeight: FontWeight.w100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()),
                          // SignUpState()),
                        );
                      },
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                          color: Colors.orange[700],
                        ),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
