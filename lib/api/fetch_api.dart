import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:starwars_project/model/fetch_http_model.dart';

class Api {
  ValueNotifier api = ValueNotifier([]);
  ValueNotifier loading = ValueNotifier(true);
  String url = 'https://swapi.dev/api/people';

  callApi() async {
    var client = http.Client();
    loading.value = true;
    try {
      var response = await client.get(Uri.parse(url));
      var res = jsonDecode(response.body);
      var resData = res['results'];
      api.value = resData.map((e) => HttpModel.fromJson(e)).toList();
    } finally {
      client.close();
      loading.value = false;
    }
  }
}
