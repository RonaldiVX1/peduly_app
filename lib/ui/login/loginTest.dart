import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peduly_app/provider/authService.dart';
import 'package:peduly_app/provider/google_signIn.dart';
import 'package:peduly_app/ui/home/homeState.dart';
import 'package:peduly_app/ui/resetpassword/forget_pass.dart';
import 'package:peduly_app/ui/signup/sign_up_state.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';
import 'package:provider/provider.dart';

class LoginTest extends StatefulWidget {
  static const routeName = '/loginTest';

  @override
  _LoginTestState createState() => _LoginTestState();
}

class _LoginTestState extends State<LoginTest> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _smsCode = TextEditingController();
  String verificationId;
  bool _passwordVisible = true;
  bool codeSent = false;
  bool sign = true;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  login() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeState())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: "User email tidak ditemukan!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "Password salah!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
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
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              IconButton(
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    // Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_rounded)),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                child: Image.asset(
                  'assets/peduly.png',
                  height: 70,
                  width: 70,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
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
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum memiliki akun?',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w100,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpState()),
                          );
                        },
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              color: Colors.orange[700],
                              decoration: TextDecoration.underline),
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
                    child: Center(
                      child: new Container(
                          child: InkWell(
                            onTap: (){
                            setState(() {
                              sign = true;
                            });
                          },
                        child: Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w100),
                        ),
                      )),
                    ),
                  ),
                  Text(
                    "|",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Expanded(
                    child: Center(
                      child: new Container(
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              sign = false;
                            });
                          },
                        child: Text(
                          'No.HP',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w100),
                        ),
                      )),
                    ),
                  ),
                ]),
              ),
              sign ? Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                            child: TextField(
                              showCursor: true,
                              controller: _emailController,
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
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                            child: TextField(
                              obscureText: !_passwordVisible,
                              cursorColor: Colors.black45,
                              keyboardType: TextInputType.text,
                              controller: _passwordController,
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
                                hintText: 'Password',
                                hintStyle:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                                suffixIcon: IconButton(
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
                          Padding(
                            padding: const EdgeInsets.only(left: 210),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgetPassScreen()),
                                  );
                                },
                                child: Text(
                                  "Lupa Password?",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.orange[800],
                                      decoration: TextDecoration.underline),
                                )),
                          ),
                          pedulyButton(
                            context: context,
                            text: 'Masuk',
                            isEnabled: true,
                            onPressed: () async {
                              login();
                            },
                          ),
                        ],
                      ),
                    )
                  : Container(
                    child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              showCursor: true,
                              controller: _emailController,
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
                                  hintText: 'No.HP',
                                  hintStyle: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                          ),
                          pedulyButton(
                            context: context,
                            text: codeSent ? 'Verify' : 'Masuk',
                            isEnabled: true,
                            onPressed: () async {
                              codeSent
                                  ? AuthService().signInwithOTP(
                                      _smsCode.text, verificationId)
                                  : loginPhone();
                            },
                          ),
                        ],
                      ),
                  ),
              codeSent
                  ? Container(
                      padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        showCursor: true,
                        controller: _smsCode,
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
                            hintText: 'Masukkan Kode OTP',
                            hintStyle:
                                TextStyle(fontSize: 16, color: Colors.grey)),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
