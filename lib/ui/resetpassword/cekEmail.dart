import 'package:flutter/material.dart';
import 'package:peduly_app/ui/home/homeState.dart';
import 'package:peduly_app/widgets/appbars/back_appbar_menu_widget.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';
import 'package:open_mail_app/open_mail_app.dart';

class CekEmailScreen extends StatefulWidget {
  static const routeName = '/checkEmail';

  @override
  _CekEmailScreenState createState() => _CekEmailScreenState();
}

class _CekEmailScreenState extends State<CekEmailScreen> {
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
              backAppBarMenuWidget(context: context),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 64, 8, 0),
                  child: Image.asset(
                    'assets/mail.png',
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  'Cek Emailmu',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 24),
                child: Text(
                  'Kami telah mengirim instrukti ganti kata sandi baru\nke email kamu.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              pedulyButton(
                context: context,
                text: 'Buka Email',
                isEnabled: true,
                onPressed: () async {
                  OpenMailApp.openMailApp();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeState()),
                  );
                },
              ),
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
