import 'package:flutter/material.dart';
import 'package:peduly_app/ui/home/menu_donation.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';

class ComposeTweet extends StatefulWidget {
  // final bool isRetweet;
  // final bool isTweet;
  @override
  State<ComposeTweet> createState() => _ComposeTweetState();
}

class _ComposeTweetState extends State<ComposeTweet> {
  Widget header() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      // title: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Image.asset(
      //       'assets/pedulytext.png',
      //       fit: BoxFit.contain,
      //       height: 32,
      //     ),
      //   ],
      // ),
      leading: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      actions: [
        IconButton(
            iconSize: 90,
            onPressed: () {},
            icon: Image.asset(
              'assets/posting_button.png',
            ))
      ],
    );
  }

  Widget body() {
    //  final _ComposeTweetReplyPageState viewState;
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.black,
              ),
              SizedBox(width: 10),
              Expanded(
                child: _TextField(),
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header(),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: body(),
          ),
          Positioned(
            bottom: 0,
            child: _BottomWidget(),
          ),
        ],
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          onChanged: (text) {},
          maxLines: null,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Cerita kebaikan apa hari ini?',
            hintStyle: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(1, 0),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  'Tag : ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xffE7513B),
              ),
              padding: EdgeInsets.symmetric(vertical: 19),
              margin: EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                'Kirim',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
