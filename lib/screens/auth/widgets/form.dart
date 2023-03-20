import 'package:flutter/material.dart';

class MyForm extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType keyBoard;
  final bool obscureText;
  final dynamic validator;
  const MyForm(
      {super.key,
      required this.controller,
      required this.hint,
      required this.keyBoard,
      required this.obscureText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white70,
          ),
          child: TextFormField(
            keyboardType: keyBoard,
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: hint,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.pink,
              )),
            ),
          ),
        ));
  }
}
