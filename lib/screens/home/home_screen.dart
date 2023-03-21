import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_project/components/header.dart';
import 'package:starwars_project/components/loading/loading.dart';
import 'package:starwars_project/components/my_scaffold.dart';
import 'package:starwars_project/provider/api/fetch_api.dart';
import 'package:starwars_project/screens/home/components/list_http.dart';
import 'package:starwars_project/screens/home/widget/fav_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Api controller = Api();
    controller.callApi();

    Api api = Provider.of<Api>(context);
    return MyScaffold(
        insideScaffold: SizedBox(
      child: api.loading
          ? const LoadingScreen()
          : Column(
              children:  [
                const MyHeader(),
                ListHttp(controller: controller,),
                const Expanded(child: FavList()),
              ],
            ),
    ));
  }
}
