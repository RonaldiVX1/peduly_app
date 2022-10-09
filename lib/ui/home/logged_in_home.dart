import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peduly_app/provider/google_signIn.dart';
import 'package:provider/provider.dart';

class LoggedInHome extends StatelessWidget {
  static const routeName = '/loggedIn';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logged In'),
        backgroundColor: Colors.deepOrange[800],
        centerTitle: true,
        actions: [
          Row(
            children: [
              //cari cara biar jadi 1 button
              TextButton(
                onPressed: () {
                  _signOut();
                }, 
                child: Text('Logout', style: TextStyle(color: Colors.blue),)
                ),
                TextButton(
                onPressed: () {
                  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogout();
                }, 
                child: Text('G_Logout', style: TextStyle(color: Colors.white),)
                ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Text('Logged In'),
        )
      ),
    );
  }
}

 _signOut() async {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    await _firebaseAuth.signOut();
   }