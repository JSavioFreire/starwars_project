import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:starwars_project/model/charts_model.dart';
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

  getChartData() {
    final List<GDPData> chartData = [
      for (int i = 0; i < api.value.length; i++)
        GDPData(
            api.value[i].name,
            api.value[i].birthYear == 'unknown'
                ? 500
                : api.value[i].birthYear == '41.9BBY'
                    ? 41
                    : int.parse(api.value[i].birthYear
                        .replaceAll(RegExp('[^0-9]'), ''))),
    ];
    return chartData;
  }

  int color(skinColor) {
    if (skinColor == 'fair') {
      return 1;
    } else if (skinColor == 'gold') {
      return 2;
    } else if (skinColor == 'white, blue') {
      return 3;
    } else if (skinColor == 'white') {
      return 4;
    } else if (skinColor == 'light') {
      return 5;
    } else if (skinColor == 'white, red') {
      return 6;
    } else {
      return 0;
    }
  }

  getChartDataTwo() {
    final List<GDPData> chartData = [
      for (int i = 0; i < api.value.length; i++)
        GDPData(api.value[i].name, color(api.value[i].skinColor)),
    ];
    return chartData;
  }
}
