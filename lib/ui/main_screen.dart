import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peduly_app/ui/akun/akun_screen.dart';
import 'package:peduly_app/ui/akun/ubahprofil/ubah_profil_screen.dart';
import 'package:peduly_app/ui/donation/donation_screen.dart';
import 'package:peduly_app/ui/feed/feed.dart';
import 'package:peduly_app/ui/home/home.dart';
import 'package:peduly_app/ui/home/logged_in_home.dart';
import 'package:peduly_app/ui/notification/notification_screen.dart';
import 'package:peduly_app/utils/const_value.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedNavBarIndex = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavBarIndex = index;
    });
  }

  final List _screens = [
    HomeScreen(),
    DonationScreen(
        // arrTitle: 'bencanaAlam',
        ),
    FeedPage(),
    NotificationScreen(),
    AkunScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedNavBarIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(0, 1))
          ],
        ),
        child: _buildBottomNavigationBar(
            currentIndex: _selectedNavBarIndex, action: _changeSelectedNavBar),
      ),
      // floatingActionButton: _buildFloatingActionButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Widget _buildFloatingActionButton() {
  //   return Padding(
  //     padding: EdgeInsets.only(top: 45),
  //     child: SizedBox(
  //       height: 48,
  //       width: 48,
  //       child: FloatingActionButton(
  //         backgroundColor: Colors.transparent,
  //         elevation: 0,
  //         onPressed: () {
  //           Navigator.pushNamed(context, '/feed');
  //         },
  //         child: Container(
  //           height: 48,
  //           width: 48,
  //           decoration: BoxDecoration(
  //               border: Border.all(color: Colors.white, width: 4),
  //               shape: BoxShape.circle,
  //               color: Colors.red),
  //           child: Image.asset(
  //             PEDULY_LOGO,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildBottomNavigationBar(
      {@required int currentIndex, @required Function(int index) action}) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: currentIndex == 0
                ? SvgPicture.asset(HOME_ICON_SELECTED)
                : SvgPicture.asset(HOME_ICON),
            label: 'home'),
        BottomNavigationBarItem(
            icon: currentIndex == 1
                ? SvgPicture.asset(CLIPBOARD_TEXT_SELECTED)
                : SvgPicture.asset(CLIPBOARD_TEXT),
            label: 'favorite'),
        BottomNavigationBarItem(
            icon: currentIndex == 2
                ? SvgPicture.asset(PEDULY_LOGO_SELECTED)
                : SvgPicture.asset(PEDULY_LOGO),
            label: 'peduly'),
        BottomNavigationBarItem(
            icon: currentIndex == 3
                ? SvgPicture.asset(TASK_SQUARE_SELECTED)
                : SvgPicture.asset(TASK_SQUARE),
            label: 'notification'),
        BottomNavigationBarItem(
            icon: currentIndex == 4
                ? SvgPicture.asset(USER_ICON_SELECTED)
                : SvgPicture.asset(USER_ICON),
            label: 'user'),
      ],
      currentIndex: currentIndex,
      onTap: action,
    );
  }
}
