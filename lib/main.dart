import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/donation.dart';
import 'package:peduly_app/data/model/instruksi_data.dart';
import 'package:peduly_app/data/model/test.dart';
import 'package:peduly_app/provider/authService.dart';
import 'package:peduly_app/ui/adayangbaru/adayangbaru.dart';
import 'package:peduly_app/ui/akun/akun_screen.dart';
import 'package:peduly_app/ui/akun/bantuan/bantuan.dart';
import 'package:peduly_app/ui/akun/pengingatdonasi/pengingat_donasi_screen.dart';
import 'package:peduly_app/ui/akun/syaratdanketentuan/syarat_dan_ketentuan.dart';
import 'package:peduly_app/ui/akun/tentangpeduly/tentang_peduly.dart';
import 'package:peduly_app/ui/akun/ubahprofil/rekening.dart';
import 'package:peduly_app/ui/akun/ubahprofil/ubah_profil_screen.dart';
import 'package:peduly_app/ui/akun/ubahprofil/verifikasi_akun_individu.dart';
import 'package:peduly_app/ui/akun/ubahprofil/verifikasi_akun_organisasi.dart';
import 'package:peduly_app/ui/detail/detail_donation_screen.dart';
import 'package:peduly_app/ui/feed/compose.dart';
import 'package:peduly_app/ui/feed/feed.dart';
import 'package:peduly_app/ui/galangdana/galang_dana_main.dart';
import 'package:peduly_app/ui/galangdana/galang_dana_page.dart';
import 'package:peduly_app/ui/galangdana/galang_dana_screen.dart';
import 'package:peduly_app/ui/home/home.dart';
import 'package:peduly_app/ui/home/homeState.dart';
import 'package:peduly_app/ui/lanjutdonation/instruksipembayaran/instruksi_pembayaran_screen.dart';
import 'package:peduly_app/ui/lanjutdonation/instruksipembayaran/sukses_pembayaran_screen.dart';
import 'package:peduly_app/ui/lanjutdonation/transfer/transfer_screen.dart';
import 'package:peduly_app/ui/main_screen.dart';
import 'package:peduly_app/ui/notification/notification_screen.dart';
import 'package:peduly_app/ui/resetpassword/cekEmail.dart';
import 'package:peduly_app/ui/resetpassword/forget_pass.dart';
import 'package:peduly_app/ui/signup/signup.dart';
import 'package:peduly_app/ui/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:peduly_app/ui/resetpassword/reset_password.dart';
import 'package:peduly_app/ui/resetpassword/reset_password_success.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Donation donation = listDonation[0];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peduly App',
      home: HomeState(),
      debugShowCheckedModeBanner: false,
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignupScreen.routeName: (context) => SignupScreen(),
        ForgetPassScreen.routeName: (context) => ForgetPassScreen(),
        CekEmailScreen.routeName: (context) => CekEmailScreen(),
        ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
        ResetPasswordSuccessScreen.routeName: (context) =>
            ResetPasswordSuccessScreen(),
        DetailDonationScreen.routeName: (context) => DetailDonationScreen(
            donation: ModalRoute.of(context).settings.arguments as Bencana),
        TransferScreen.routeName: (context) => TransferScreen(
              nominal: ModalRoute.of(context).settings.arguments,
            ),
        // InstruksiPembayaranScreen.routeName: (context) => InstruksiPembayaranScreen(),
        InstruksiPembayaranScreen.routeName: (context) =>
            InstruksiPembayaranScreen(
              instruksiData:
                  ModalRoute.of(context).settings.arguments as InstruksiData,
            ),
        '/galang_dana': (context) => GalangDanaPage(),
        '/buat_galang_dana': (context) => GalangDanaScreen(),
        '/galang_dana_main': (context) => GalangDanaMain(),
        '/feed': (context) => FeedPage(),
        '/verif_individu': (context) => VerifAkunIndividu(),
        '/verif_organisasi': (context) => VerifAkunOrganisasi(),
        '/rekening': (context) => Rekening(),
        '/notifikasi': (context) => NotificationScreen(),
        '/compose': (context) => ComposeTweet(),
        '/ada_yang_baru': ((context) => AdaYangBaruPage()),
        '/pengingat_donasi': ((context) => PengingatDonasiScreen()),
        '/bantuan': ((context) => BantuanPage()),
        '/tentang_peduly': ((context) => TentangPeduly()),
        '/syarat_dan_ketentuan': ((context) => SyaratDanKetentuanPage())
      },
    );
  }
}
