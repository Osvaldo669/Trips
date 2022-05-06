import 'dart:convert';

import 'package:flutter_cubit/models/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseURL = 'http://mark.bslmeiyu.com/api';

  Future<List<DataModel>> getInfo() async {
    var apiURL = '/getplaces';
    http.Response response = await http.get(Uri.parse(baseURL + apiURL));
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
