import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:starwars_project/model/fetch_http_model.dart';

class Api extends ChangeNotifier {
  ValueNotifier api = ValueNotifier([]);
  bool loading = true;
  String url = 'https://swapi.dev/api/people';

  Api() {
    callApi();
  }

  void refresh() {
    notifyListeners();
  }

  callApi() async {
    var client = http.Client();
    loading = true;
    try {
      var response = await client.get(Uri.parse(url));
      var res = jsonDecode(response.body);
      var resData = res['results'];
      api.value = resData.map((e) => HttpModel.fromJson(e)).toList();
      notifyListeners();
    } finally {
      client.close();
      loading = false;
      notifyListeners();
    }
  }
}
