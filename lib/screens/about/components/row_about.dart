import 'package:flutter/material.dart';

class RowAbout extends StatelessWidget {
  final String left;
  final String right;
  const RowAbout({super.key, required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 25, bottom: 25),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('$left: '),
            Text(
              right,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
