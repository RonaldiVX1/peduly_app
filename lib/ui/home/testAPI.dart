import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TestAPI extends StatefulWidget {
  @override
  _TestAPIState createState() => _TestAPIState();
}

class _TestAPIState extends State<TestAPI> {
  List _data = [];
  getCurrent() async {
    var apiURL = "http://www.api.peduly.com/api/galangdana";
    var apiResult = await http.get(Uri.parse(apiURL));
    setState(() {
      _data = json.decode(apiResult.body)['current_donasi'];
    });
  }


@override
  void initState() {
    getCurrent();
    super.initState();
  }

 SingleChildScrollView _tabelData(){
   return SingleChildScrollView(
     scrollDirection: Axis.vertical,
     child: SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: DataTable(
         columnSpacing: 15,
         columns: [
           DataColumn(label: Text("Current")),
           DataColumn(label: Text("id")),
         ],
         rows: _data.map((data) => DataRow(
           cells: <DataCell>[
          DataCell(Center(child: Text(data["current_donation"].toString()))),
          DataCell(Center(child: Text(data["campaign_id"].toString()))),
         ])).toList()
         ),
       ),
     );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 5),
            _tabelData(),
            Text(_data[1]['campaign_id'].toString()),
          ],
        ),
      ),
    );
  }
}
