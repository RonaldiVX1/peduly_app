import 'package:flutter/material.dart';

Widget doaItem(String body) {
  return Container(
    margin: EdgeInsets.only(bottom: 30),
    width: 295,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(0, 3), blurRadius: 6, color: Colors.black12),
        ]),
    child: Column(
      children: [
        _buildTopSection(),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Text('$body'),
        ),
        _buildButtosSection()
      ],
    ),
  );
}

Widget _buildTopSection() {
  return Padding(
    padding: const EdgeInsets.only(top: 18, left: 16, right: 16, bottom: 12),
    child: SizedBox(
      height: 40,
      child: Row(
        children: [
          CircleAvatar(
            child: Icon(Icons.person),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Siska Chohl',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Color(0xff717171),
              ),
              onPressed: () {})
        ],
      ),
    ),
  );
}

Widget _buildButtosSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
    child: SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: Color(0xffE7513B),
            ),
            label: Text(
              'Suka',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff717171)),
            ),
          ),
          SizedBox(width: 25),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: Color(0xffE7513B),
            ),
            label: Text(
              'Bagikan',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff717171)),
            ),
          ),
        ],
      ),
    ),
  );
}
