import 'package:flutter/material.dart';

class Tweet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        Column(
          children: [
            _tweetBody(
                username: 'Untuk Teman',
                datepost: '1 bulan lalu',
                feedtext:
                    'Peduly Malang Calling for volunteers! \nHalo rek, Peduly malang membuka \nkesempatan besar buat kamu yang \nberdomisili di malang dan ingin \nmenambah wawasan, pengalaman, \ndan relasi dalam sebuah..'),
            Divider(
              thickness: 1,
              color: Color(0xffE4E4E4),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _tweetBody({
  String username,
  String datepost,
  String feedtext,
}) {
  return Container(
    padding: EdgeInsets.only(top: 30, left: 20, right: 20),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(backgroundColor: Colors.black),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.check_circle,
                      size: 14,
                      color: Color(0xff2196F3),
                    )
                  ],
                ),
                Text(
                  datepost,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff717171),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: Text(
                    feedtext,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                _bottomTweet(),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _bottomTweet() {
  return Row(
    children: [
      Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.favorite_outline_rounded,
              size: 25,
              color: Color(0xff717171),
            ),
          ),
          SizedBox(width: 7),
          Text(
            'Suka',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      SizedBox(width: 30),
      Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.share_outlined,
              size: 25,
              color: Color(0xff717171),
            ),
          ),
          SizedBox(width: 7),
          Text(
            'Bagikan',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    ],
  );
}
