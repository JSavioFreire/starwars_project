import 'package:flutter/material.dart';
import 'package:starwars_project/provider/api/fetch_api.dart';
import 'package:starwars_project/screens/home/widget/my_listtile.dart';

class ListHttp extends StatelessWidget {
  final Api controller;
  const ListHttp({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
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
        });
  }
}
