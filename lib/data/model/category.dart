import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final int id;
  final String title;
  final String arrTitle;
  final Icon icon;
  Category({this.id, this.title, this.arrTitle, this.icon});
}

var listCategory = [
  Category(id: 1, title: 'Panti Asuhan', arrTitle: 'pantiAsuhan', icon: Icon(Icons.house_outlined),),
  Category(id: 2, title: 'Beasiswa & pendidikan', arrTitle: 'beasiswaDanPendidikan', icon: Icon(Icons.school)),
  Category(id: 3, title: 'Kemanusiaan', arrTitle: 'kemanusiaan', icon: Icon(Icons.person),),
  Category(id: 4, title: 'Kegiatan Sosial', arrTitle: 'kegiatanSosial', icon: Icon(Icons.card_giftcard),),
  Category(id: 5, title: 'Rumah Ibadah', arrTitle: 'rumahIbadah', icon: Icon(Icons.houseboat),),
  Category(id: 6, title: 'Bencana Alam', arrTitle: 'bencanaAlam', icon: Icon(Icons.waves),),
  Category(id: 7, title: 'Kesehatan', arrTitle: 'kesehatanDanMedis', icon: Icon(Icons.local_hospital)),
];

