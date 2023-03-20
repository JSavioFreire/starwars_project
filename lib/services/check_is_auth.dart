import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_project/provider/auth/auth_provider.dart';
import 'package:starwars_project/screens/home/home_screen.dart';
import 'package:starwars_project/screens/loading/loading.dart';
import 'package:starwars_project/screens/auth/auth_screen.dart';

class CheckIsAuth extends StatelessWidget {
  const CheckIsAuth({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.usersLoading) {
      return const LoadingScreen();
    } else if (authProvider.users == null) {
      return const AuthScreen();
    } else {
      return const HomeScreen();
    }
  }
}
