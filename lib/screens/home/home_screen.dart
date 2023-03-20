import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_project/components/header.dart';
import 'package:starwars_project/components/my_scaffold.dart';
import 'package:starwars_project/provider/auth/auth_provider.dart';
import 'package:starwars_project/provider/auth/func_auth_provider.dart';
import 'package:starwars_project/screens/home/list_http/list_http.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return MyScaffold(
        insideScaffold: SizedBox(
      height: 500,
      child: Column(
        children: const [MyHeader(), Expanded(child: ListHttp())],
      ),
    ));
  }
}
