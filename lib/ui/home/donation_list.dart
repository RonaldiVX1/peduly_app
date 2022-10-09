import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/test.dart';
import 'package:peduly_app/widgets/items/vertical_donation_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonationList extends StatefulWidget {
  // final String arrTitle;
  // const DonationList(this.arrTitle);
  String kategori;
  @override
  _DonationListState createState() => _DonationListState();
}

class _DonationListState extends State<DonationList> {
  var loading = false;
  var dataList;
  var selectedIndex;
  List _data = [];

  getModels() async {
    String kategori;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('kategori') == null) {
      kategori = 'bencanaAlam';
    } else {
      kategori = prefs.getString('kategori');
    }
    //setState(() {
    //loading = true;
    //});
    var apiURL = "http://www.api.peduly.com/api/galangdana";
    var apiResult = await http.get(Uri.parse(apiURL));

    final data = jsonDecode(apiResult.body);

    return (data['kategori'][kategori] as List)
        .map((p) => Bencana.fromJson(p))
        .toList();
  }

  getCurrent() async {
    var apiURL = "http://www.api.peduly.com/api/galangdana";
    var apiResult = await http.get(Uri.parse(apiURL));
    if (!mounted) return;
    setState(() {
      _data = json.decode(apiResult.body)['current_donasi'];
    });
  }

  getTarget(String nominal) {
    if (nominal != null) {
      setState(() {
        dataList = nominal;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 15),
      child: FutureBuilder(
        future: getModels(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Bencana> posts = snapshot.data;
            return new ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  for (var j = 0; j < _data.length; j++) {
                    if (posts[i].id == _data[j]['campaign_id']) {
                      dataList = _data[j]['current_donation'].toString();
                      break;
                    } else {
                      if (j == _data.length - 1) {
                        dataList = '0';
                      }
                    }
                  }
                  return verticalDonationItem(
                      context: context, donation: posts[i], nominal: dataList);
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          return new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.all(50.0)),
                new CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}
