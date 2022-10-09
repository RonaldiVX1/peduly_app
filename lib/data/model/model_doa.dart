class model {
  String body;
  String name;
  
  // model({this.kecamatan, this.cluster, this.tahun});
  model({this.body, this.name});

  factory model.createData (Map<String, dynamic> object) {
    return model(
      body: object['body'].toString(),
      name: object['name'].toString(),
    );
  }

//   static Future <List<model_pus>> getModels() async {
//     var apiURL = "http://10.0.2.2:8000/api/puskesmas" ;
//     var apiResult = await http.get(Uri.parse(apiURL));
//     var jsonObject = json.decode(apiResult.body);
//     List<dynamic> listData = jsonObject;

//     List<model_pus> models_pus = [];
//     for (var i = 0; i < listData.length; i++) {
//       models_pus.add(model_pus.createData(listData[i]));
//     }
//     return models_pus;
//   }
}