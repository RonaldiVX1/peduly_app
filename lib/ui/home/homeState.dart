import 'package:flutter/material.dart';
import 'package:peduly_app/ui/donation/donation_screen.dart';
import 'package:peduly_app/ui/login/login.dart';
import 'package:peduly_app/ui/main_screen.dart';
import 'package:peduly_app/ui/resetpassword/cekEmail.dart';
import 'package:peduly_app/ui/resetpassword/reset_password.dart';
import 'package:peduly_app/ui/valounteer/valounteer_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeState extends StatefulWidget {
  @override
  _HomeStateState createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState> {
  // String url = "";
  Future<bool> getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('login');
  }

  @override
  void initState() {
    super.initState();
    // _initDynamicLinks();
    startAuth();
  }

  startAuth() async {
    await getAuth().then((logedIn) {
      if (logedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MainScreen();
            },
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        );
      }
    });
  }

  ///Retreive dynamic link firebase.
  // void _initDynamicLinks() async {
  //   final PendingDynamicLinkData data =
  //       await FirebaseDynamicLinks.instance.getInitialLink();
  //   final Uri deepLink = data?.link;

  //   if (deepLink != null) {
  //     _handleDynamicLink(deepLink);
  //   }
  //   FirebaseDynamicLinks.instance.onLink(
  //       onSuccess: (PendingDynamicLinkData dynamicLink) async {
  //     final Uri deepLink = dynamicLink?.link;

  //     if (deepLink != null) {
  //       _handleDynamicLink(deepLink);
  //     }
  //   }, onError: (OnLinkErrorException e) async {
  //     print(e.message);
  //   });
  // }

  // _handleDynamicLink(Uri url) {
  //   List<String> separatedString = [];
  //   separatedString.addAll(url.path.split('/'));
  //   if (separatedString[1] == "resetPass") {
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: ,
        );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body:

  //     ChangeNotifierProvider(
  //       create: (context) => GoogleSignInProvider(),
  //       child: StreamBuilder(
  //         stream: FirebaseAuth.instance.authStateChanges(),
  //         builder: (context, snapshot) {
  //           if (snapshot.connectionState == ConnectionState.waiting) {
  //             return Center(
  //               child: CircularProgressIndicator(),
  //             );
  //           } else if (snapshot.hasData) {
  //             return MainScreen();
  //           } else if (snapshot.hasError) {
  //             return Center(
  //               child: Text('Something Went Wrong'),
  //             );
  //           } else {
  //             return LoginScreen();
  //           }
  //         },
  //       ),
  //     ),
  //   );
  // }

  // @override
  // noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
