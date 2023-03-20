import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_project/provider/auth/func_auth_provider.dart';
import 'package:starwars_project/screens/auth/widgets/form.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    FuncAuthProvider funcAuthProvider = Provider.of<FuncAuthProvider>(context);
    return Column(
      children: [
        MyForm(
            controller: funcAuthProvider.registerNameController,
            hint: 'Nome',
            keyBoard: TextInputType.emailAddress,
            obscureText: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo vazio. Digite seu nome!';
              } else {
                return null;
              }
            }),
        MyForm(
          controller: funcAuthProvider.registerEmailController,
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
            controller: funcAuthProvider.registerPasswordController,
            hint: 'Senha',
            keyBoard: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo vazio. Digite uma senha';
              } else if (value.length < 6) {
                return 'Senha muito curta! Sua senha deve ter no mínimo 6 caracteres';
              } else {
                return null;
              }
            }),
        MyForm(
            controller: funcAuthProvider.registerConfirmPasswordController,
            hint: 'confirmar senha',
            keyBoard: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo vazio. Digite uma senha';
              } else if (value.length < 6) {
                return 'Senha muito curta! Sua senha deve ter no mínimo 6 caracteres';
              } else if (funcAuthProvider.registerPasswordController.text !=
                  funcAuthProvider.registerConfirmPasswordController.text) {
                return 'As senha não são iguais';
              } else {
                return null;
              }
            }),
      ],
    );
  }
}
