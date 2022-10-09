import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:peduly_app/ui/login/login.dart';
import 'package:peduly_app/ui/login/loginTest.dart';
import 'package:peduly_app/ui/main_screen.dart';

class AuthService {
  handleAuth(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot){
        if (snapshot.hasData) {
          return MainScreen();
        } else {
          return LoginScreen();
        }
      }
      );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signIn(AuthCredential authCreds){
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }
  signInwithOTP(smsCode, verId){
    AuthCredential authCreds = PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }
}