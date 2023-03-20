import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final Widget insideScaffold;
  const MyScaffold({super.key, required this.insideScaffold});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: insideScaffold,
    );
  }
}
