import 'dart:convert';

import 'package:http/http.dart' as http;

class DataServices {
  String baseURL = 'http://mark.bslmeiyu.com/api';

  getInfo() async {
    var apiURL = '/getplaces';
    http.Response response = await http.get(Uri.parse(baseURL + apiURL));
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
