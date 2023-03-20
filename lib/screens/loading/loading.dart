import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:starwars_project/components/my_scaffold.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        insideScaffold: Center(
      child: Lottie.asset('assets/loading.json'),
    ));
  }
}
