import 'package:flutter/material.dart';
import 'package:peduly_app/ui/resetpassword/reset_password_success.dart';
import 'package:peduly_app/utils/password_helper.dart';
import 'package:peduly_app/widgets/appbars/back_appbar_menu_widget.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = '/resetPassword';

  const ResetPasswordScreen({Key key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordVisible = true;
  bool _confirmPasswordVisible = true;
  bool _isErrorPasswordVisible = false;
  String _passwordErrorMessage =
      'Password harus menggunakan karakter dan angka';

  void _validatePassword() {
    setState(() {
      if (PasswordHelper()
          .checkIfPasswordIsValid(value: _passwordController.text)) {
        if (_passwordController.text != _confirmPasswordController.text) {
          _passwordErrorMessage = 'Password dan Confirm Password tidak sama';
          _isErrorPasswordVisible = true;
        } else {
          Navigator.pushNamed(context, ResetPasswordSuccessScreen.routeName);
        }
      } else {
        _passwordErrorMessage = 'Password harus menggunakan karakter dan angka';
        _isErrorPasswordVisible = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _isErrorPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  backAppBarMenuWidget(context: context),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: _buildHeadingText(),
                  ),
                  _buildSubHeadingText(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 22, 16, 0),
                    child: Text(
                      'Password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildTextFieldPassword(
                    passwordController: _passwordController,
                    isVisible: _passwordVisible,
                    onVisibilityClicked: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Visibility(
                      child: Text(
                        _passwordErrorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                      visible: _isErrorPasswordVisible,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 22, 15, 0),
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildTextFieldPasswordConfirm(
                    passwordConfirmController: _confirmPasswordController,
                    isVisible: _confirmPasswordVisible,
                    onVisibilityClicked: () {
                      setState(() {
                        _confirmPasswordVisible = !_confirmPasswordVisible;
                      });
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 24.0, left: 12, right: 12),
                    child: pedulyButton(
                      context: context,
                      text: 'Reset Password',
                      isEnabled: true,
                      onPressed: _validatePassword,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildHeadingText() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
    child: Text(
      'Buat Password Baru',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _buildSubHeadingText() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
    child: Text(
      'Password harus berbeda dari sebelumnya'
      '\ndan belum pernah digunakan',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget _buildTextFieldPassword(
    {@required TextEditingController passwordController,
    @required bool isVisible,
    @required Function() onVisibilityClicked}) {
  return Container(
    padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
    child: TextField(
      obscureText: !isVisible,
      cursorColor: Colors.black45,
      keyboardType: TextInputType.text,
      controller: passwordController,
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
        hintText: "Masukkan kata sandi",
        hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black45,
          ),
          onPressed: onVisibilityClicked,
        ),
      ),
    ),
  );
}

Widget _buildTextFieldPasswordConfirm(
    {@required bool isVisible,
    @required TextEditingController passwordConfirmController,
    @required Function() onVisibilityClicked}) {
  return Container(
    padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
    child: TextField(
      obscureText: isVisible,
      cursorColor: Colors.black45,
      keyboardType: TextInputType.text,
      controller: passwordConfirmController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black45,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: EdgeInsets.all(20),
        hintText: 'Masukkan ulang kata sandi',
        hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black45,
          ),
          onPressed: onVisibilityClicked,
        ),
      ),
    ),
  );
}
