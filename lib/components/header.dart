import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_project/provider/auth/auth_provider.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Container(
      padding: const EdgeInsets.only(left: 10, top: 20),
      height: 80,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(TextSpan(
              text: 'Olá, ',
              style: const TextStyle(fontSize: 16),
              children: [
                TextSpan(
                  text: authProvider.users!.displayName,
                  style: const TextStyle(fontSize: 20),
                )
              ])),
          IconButton(
              onPressed: () {
                authProvider.logout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
