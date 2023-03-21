import 'package:flutter/material.dart';
import 'package:starwars_project/model/fetch_http_model.dart';
import 'package:starwars_project/screens/about/about.dart';

class MyListTile extends StatelessWidget {
  final HttpModel person;
  const MyListTile({super.key, required this.person});

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: () {
        showModal(context: context, person: person);
      },
      title: Text(person.name.toString()),
    );
  }
}
