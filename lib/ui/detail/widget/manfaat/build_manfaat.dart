import 'package:flutter/material.dart';

class BuildManfaat extends StatelessWidget {
  const BuildManfaat({Key key, @required this.namaPenerima}) : super(key: key);
  final String namaPenerima;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 14),
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 45,
            width: 45,
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(196, 196, 196, 0.4),
              child: Icon(
                Icons.person_outline,
                color: Color.fromRGBO(33, 33, 33, 1),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          SizedBox(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  namaPenerima,
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
