import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peduly_app/provider/google_signIn.dart';
import 'package:peduly_app/ui/main_screen.dart';
import 'package:peduly_app/ui/signup/signup.dart';
import 'package:provider/provider.dart';

class SignUpState extends StatelessWidget {
  static const routeName = '/signupState';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData){
              return MainScreen();
            }
            else if (snapshot.hasError){
              return Center(child: Text('Something Went Wrong'),);
            }else {
              return SignupScreen();
            }
          },
        ),
      ),
    );
  }
}

