import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String name;
  final String email;
  final String status;
  final String tanggalLahir;
  final String tipeUser;

  User({
    this.name,
    this.email,
    this.status,
    this.tanggalLahir,
    this.tipeUser,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      status: json['status_akun'],
      tanggalLahir: json['tanggal_lahir'],
      tipeUser: json['tipe'],
    );
  }

  static Future<User> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('login');
    print("TOKEN :" + prefs.getString('login').toString());
    final response = await http.get(
        Uri.parse('https://api.peduly.com/api/user'),
        headers: <String, String>{
          // 'authorization': 'Bearer ' + token,
          // 'accept': 'pplication/json',
          // 'content-encoding': 'br'
          HttpHeaders.authorizationHeader: 'Bearer ' + token,
        });

    if (response.statusCode == 200) {
      print(response.body);
      return User.fromJson(jsonDecode(response.body)['user']);
    } else {
      print(response.body.toString());
      print(response.statusCode);
      throw Exception('Failed to load user');
    }
  }

  static String _name(dynamic user) {
    return user['name'];
  }

  static String _statusAkun(dynamic user) {
    return user['statusAkun'];
  }

  static String _email(dynamic user) {
    return user['email'];
  }
}
