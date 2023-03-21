import 'package:flutter/material.dart';
import 'package:starwars_project/components/loading/loading.dart';
import 'package:starwars_project/provider/api/fetch_api.dart';
import 'package:starwars_project/screens/home/widget/my_listtile.dart';

class ListHttp extends StatelessWidget {
  const ListHttp({super.key});

  @override
  Widget build(BuildContext context) {
    Api controller = Api();
    controller.callApi();

    return AnimatedBuilder(
        animation: Listenable.merge([controller.loading, controller.api]),
        builder: ((context, child) => controller.loading.value
            ? const LoadingScreen()
            : AnimatedBuilder(
                animation: Listenable.merge([controller.api]),
                builder: (context, child) {
                  return Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.api.value.length,
                        itemBuilder: ((context, index) {
                          return MyListTile(
                            person: controller.api.value[index],
                          );
                        })),
                  );
                })));
  }
}
