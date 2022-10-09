import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/model_doa.dart';
import 'package:peduly_app/widgets/items/doa_item.dart';

class DoaList extends StatefulWidget {
  @override
  _DoaListState createState() => _DoaListState();
}

class _DoaListState extends State<DoaList> {
  getModels() async {
    var apiURL = "http://api.peduly.com/api/doa";
    var apiResult = await http.get(Uri.parse(apiURL));
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listData = jsonObject;

    List<model> models = [];
    for (var i = 0; i < listData.length; i++) {
      models.add(model.createData(listData[i]));
    }
    return models;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
          future: getModels(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(child: Text("Loading....")),
              );
            } else {
              return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 16),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return doaItem(snapshot.data[i].body);
                  });
            }
          }),
    );
  }
}



// Widget buildDoaList({@required BuildContext context}) {
//   return Container(
//       child: Column(
//     children: [
//       //doaItem(),
//     ],
//   ));
// }
