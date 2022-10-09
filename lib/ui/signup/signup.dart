import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peduly_app/provider/google_signIn.dart';
import 'package:peduly_app/ui/home/homeState.dart';
import 'package:peduly_app/ui/login/login.dart';
import 'package:peduly_app/ui/login/widgets/border_icon.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  static const routeName = '/daftar';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _passwordVisible = true;

  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
  }

  registerWithEmailAndPassword(
      String name, String password, String email) async {
    if (name.isEmpty || password.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Lengkapi data dengan tepat")));
    } else {
      try {
        final url = Uri.parse('https://api.peduly.com/api/auth/register');
        Map<String, String> requestBody = <String, String>{
          'name': name,
          'email': email,
          'password': password,
          // 'password_confirmation': confirmedPasswordController.text,
        };
        var request = http.MultipartRequest('POST', url)
          ..fields.addAll(requestBody);
        var response = await request.send();
        print(response.statusCode);

        if (response.statusCode >= 200 && response.statusCode < 300) {
          print('User Registed');
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("User Berhasil Dibuat")));
          final respStr = await response.stream.bytesToString();

          var body = jsonDecode(respStr);
          print(
            body,
          );
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("The email has already been taken.")));
        }
      } catch (error) {
        print(error);
      }
    }
  }

  //           AUTH WITH FIREBASE

  // try {
  //   UserCredential result = await _auth.createUserWithEmailAndPassword(
  //       email: email, password: password);
  //   User user = result.user;
  //   user.updateDisplayName(name);
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => HomeState()));
  //   return user;
  // } on FirebaseAuthException catch (e) {
  //     if (e.code == 'email-already-in-use') {
  //     Fluttertoast.showToast(
  //         msg: "Email telah terpakai!",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     }
  // }

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
                  'Daftar',
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
                      'Sudah memiliki akun?',
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
                                builder: (context) => HomeState()),
                          );
                        },
                        child: Text(
                          'Masuk',
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
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       InkWell(
              //         splashColor: Colors.grey[700],
              //         onTap: () {
              //           final provider = Provider.of<GoogleSignInProvider>(
              //               context,
              //               listen: false);
              //           provider.googleLogin();
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
                  controller: _usernameController,
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
                      hintText: 'Username',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
                ),
              ),
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
                padding: EdgeInsets.fromLTRB(10, 0, 10, 24),
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
              Container(
                height: 55,
                padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: ElevatedButton(
                  style: raisedButtonStyle,
                  child: Text(
                    "Daftar",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () async {
                    await registerWithEmailAndPassword(
                      _usernameController.text,
                      _passwordController.text,
                      _emailController.text,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
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
              ),
              SizedBox(
                height: 20,
              ),

              Column(
                children: [
                  Text(
                    'Dengan mendaftar, kamu setuju dengan',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w100,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Syarat dan Ketentuan',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.orange[700],
                                decoration: TextDecoration.underline),
                            textAlign: TextAlign.center,
                          )),
                      Text(
                        '&  ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w100,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Kebijakan Privasi',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.orange[700],
                                decoration: TextDecoration.underline),
                            textAlign: TextAlign.center,
                          )),
                      Text(
                        ' peduly.com ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w100,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.deepOrange[800],
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
);
