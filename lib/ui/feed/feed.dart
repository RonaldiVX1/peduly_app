import 'package:flutter/material.dart';
import 'package:peduly_app/ui/feed/tweet.dart';
import 'package:peduly_app/ui/home/menu_donation.dart';

class FeedPage extends StatelessWidget {
  Widget header() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.5,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/pedulytext.png',
            fit: BoxFit.contain,
            height: 32,
          ),
        ],
      ),
    );
  }

  Widget _compose(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xffE7513B),
      onPressed: () {
        Navigator.pushNamed(context, '/compose');
      },
      child: Icon(Icons.border_color_outlined),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header(),
      body: SafeArea(
        child: _FeedPageBody(),
      ),
      floatingActionButton: _compose(context),
    );
  }
}

class _FeedPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Tweet(),
            Tweet(),
            Tweet(),
            Tweet(),
            Tweet(),
            Tweet(),
            Tweet(),
          ]),
        ),
      ],
    );
  }
}

// var contohtext =
//     'Peduly Malang Calling for volunteers!\nHalo rek, Peduly malang membuka kesempatan besar buat kamu yang \nberdomisili di malang dan ingin \nmenambah wawasan, pengalaman, dan \nrelasi dalam sebuah...';
