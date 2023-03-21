import 'package:flutter/material.dart';
import 'package:starwars_project/components/header.dart';
import 'package:starwars_project/components/my_scaffold.dart';
import 'package:starwars_project/screens/home/components/list_http.dart';
import 'package:starwars_project/screens/home/widget/fav_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        insideScaffold: SizedBox(
      child: Column(
        children: const [
          MyHeader(),
          ListHttp(),
          Expanded(child: FavList()),
        ],
      ),
    ));
  }
}
