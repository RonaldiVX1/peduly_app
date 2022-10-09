import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peduly_app/provider/authService.dart';
import 'package:peduly_app/provider/google_signIn.dart';
import 'package:peduly_app/ui/home/homeState.dart';
import 'package:peduly_app/ui/login/widgets/border_icon.dart';
import 'package:peduly_app/ui/main_screen.dart';
import 'package:peduly_app/ui/resetpassword/forget_pass.dart';
import 'package:peduly_app/ui/signup/sign_up_state.dart';
import 'package:peduly_app/ui/signup/signup.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _smsCode = TextEditingController();
  String verificationId;
  bool _passwordVisible = true;
  bool codeSent = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  login() async {
    if (_passwordController.text.isNotEmpty &&
        _emailController.text.isNotEmpty) {
      try {
        final url = Uri.parse('https://api.peduly.com/api/auth/login');
        Map<String, String> requestBody = <String, String>{
          'email': _emailController.text,
          'password': _passwordController.text
        };
        var request = http.MultipartRequest('POST', url)
          ..fields.addAll(requestBody);
        var response = await request.send();
        if (response.statusCode == 200) {
          print('Connection OK');
          final respStr = await response.stream.bytesToString();

          var body = jsonDecode(respStr);
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString("login", body['token']);
          print(pref.getString('login').toString());
          await pref.setString("pass", _passwordController.text);

          // Navigator.of(context).pushReplacement(MaterialPageRoute(
          //   builder: (context) => MainScreen(),
          // ));

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (dialogContex) => MainScreen()),
              ModalRoute.withName("/HomePageScreen"));
          // await pref.setString("password", passwordController.text);
        } else {
          print('Connection Failed');
          print("Email atau password tidak tepat");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Email atau password Kurang tepat")));
        }
      } catch (error) {
        print(error);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Email dan Password tidak boleh kosong")));
    }
  }

  loginPhone() async {
    final PhoneVerificationCompleted verified =
        (AuthCredential authResult) async {
      AuthService().signIn(authResult);
    };
    final PhoneVerificationFailed verifyFailed =
        (FirebaseAuthException authException) {
      print('${authException.message}');
    };
    final PhoneCodeSent smsSent = (String verId, [int forceResend]) async {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };
    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _emailController.text,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verifyFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 60, 8, 8),
                child: Image.asset(
                  'assets/peduly.png',
                  height: 70,
                  width: 70,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
                child: Text(
                  'Masuk',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 24),
                child: Row(
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
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.grey[700],
                      onTap: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                      },
                      child: Image.asset(
                        'assets/g.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      splashColor: Colors.grey[700],
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => ),
                        // );
                      },
                      child: Image.asset(
                        'assets/f.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: Divider(
                          color: Colors.black54,
                          height: 36,
                        )),
                  ),
                  Text(
                    "Atau",
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: Divider(
                          color: Colors.black54,
                          height: 36,
                        )),
                  ),
                ]),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       InkWell(
              //         splashColor: Colors.grey[700],
              //         onTap: () {
              //           // final provider = Provider.of<GoogleSignInProvider>(
              //           //     context,
              //           //     listen: false);
              //           // provider.googleLogin();
              //         },
              //         child: Image.asset(
              //           'assets/g.png',
              //           height: 60,
              //           width: 60,
              //         ),
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       InkWell(
              //         splashColor: Colors.grey[700],
              //         onTap: () {
              //           // Navigator.push(
              //           //   context,
              //           //   MaterialPageRoute(builder: (context) => ),
              //           // );
              //         },
              //         child: Image.asset(
              //           'assets/f.png',
              //           height: 60,
              //           width: 60,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              //   child: Row(children: <Widget>[
              //     Expanded(
              //       child: new Container(
              //           margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              //           child: Divider(
              //             color: Colors.black54,
              //             height: 36,
              //           )),
              //     ),
              //     Text(
              //       "Atau",
              //       style: TextStyle(fontWeight: FontWeight.w100),
              //     ),
              //     Expanded(
              //       child: new Container(
              //           margin: const EdgeInsets.only(left: 20.0, right: 10.0),
              //           child: Divider(
              //             color: Colors.black54,
              //             height: 36,
              //           )),
              //     ),
              //   ]),
              // ),

              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 24),
                child: TextField(
                  showCursor: true,
                  controller: _emailController,
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
                      hintText: 'Email',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 8),
                child: TextField(
                  obscureText: !_passwordVisible,
                  cursorColor: Colors.black45,
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
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
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black45,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassScreen()),
                          // SignUpState()),
                        );
                      },
                      child: Text(
                        "Lupa Password?",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.orange[800],
                        ),
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: pedulyButton(
                    context: context,
                    text: 'Masuk',
                    isEnabled: true,
                    onPressed: login),
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  "Atau masuk dengan",
                  style: pGreyTextStyle,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BorderIcon("assets/icon_google.png"),
                  SizedBox(
                    width: 16,
                  ),
                  BorderIcon("assets/icon_facebook.png"),
                  SizedBox(
                    width: 16,
                  ),
                  BorderIcon("assets/icon_apple.png"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
