import 'package:flutter/material.dart';
import 'package:starwars_project/api/fetch_api.dart';

class ListHttp extends StatelessWidget {
  const ListHttp({super.key});

  @override
  Widget build(BuildContext context) {
    Api controller = Api();
    controller.callApi();

    return AnimatedBuilder(
        animation: Listenable.merge([controller.loading, controller.api]),
        builder: ((context, child) => controller.loading.value
            ? const CircularProgressIndicator()
            : AnimatedBuilder(
                animation: Listenable.merge([controller.api]),
                builder: (context, child) {
                  return Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 3.5)),
                        itemCount: controller.api.value.length,
                        itemBuilder: ((context, index) {
                          return Text(
                            controller.api.value[0].name,
                          );
                        })),
                  );
                })));
  }
}
