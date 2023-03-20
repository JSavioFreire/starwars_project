import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_project/provider/auth/func_auth_provider.dart';
import 'package:starwars_project/screens/auth/widgets/form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    FuncAuthProvider funcAuthProvider = Provider.of<FuncAuthProvider>(context);
    return Column(
      children: [
        MyForm(
          controller: funcAuthProvider.emailController,
          hint: 'Email',
          keyBoard: TextInputType.emailAddress,
          obscureText: false,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Campo vazio. Digite seu email!';
            } else if (value.contains('@') && value.contains('.com')) {
              return null;
            } else {
              return 'Digite um email válido!';
            }
          },
        ),
        MyForm(
            controller: funcAuthProvider.passwordController,
            hint: 'Senha',
            keyBoard: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo vazio. Digite sua senha!';
              } else {
                return null;
              }
            }),
      ],
    );
  }
}
