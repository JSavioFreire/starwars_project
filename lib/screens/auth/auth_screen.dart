import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_project/components/my_scaffold.dart';
import 'package:starwars_project/components/title.dart';
import 'package:starwars_project/provider/auth/func_auth_provider.dart';
import 'package:starwars_project/screens/auth/components/login.dart';
import 'package:starwars_project/screens/auth/components/register.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FuncAuthProvider funcAuthProvider = Provider.of<FuncAuthProvider>(context);

    String textTextButton = funcAuthProvider.isRegister
        ? 'Já tem cadastro? Clique aqui!'
        : 'Não tem cadastro? Clique aqui e cadastre-se';
    String textElevatedButton =
        funcAuthProvider.isRegister ? 'Cadastrar' : 'Entrar';

    return MyScaffold(
        insideScaffold: SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MyTitle(),
              Form(
                  key: funcAuthProvider.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Column(
                      children: [
                        funcAuthProvider.isRegister == true
                            ? const Register()
                            : const Login(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              if (funcAuthProvider.formKey.currentState!
                                  .validate()) {
                                if (funcAuthProvider.isRegister) {
                                  funcAuthProvider.register(
                                    context: context,
                                    email: funcAuthProvider
                                        .registerEmailController,
                                    password: funcAuthProvider
                                        .registerPasswordController,
                                        name: funcAuthProvider.registerNameController
                                  );
                                } else {
                                  funcAuthProvider.login(
                                      context: context,
                                      email: funcAuthProvider.emailController,
                                      password:
                                          funcAuthProvider.passwordController);
                                }
                              }
                            },
                            child: funcAuthProvider.buttonInLoading
                                ? const CircularProgressIndicator()
                                : Text(
                                    textElevatedButton,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 28),
                                  ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              funcAuthProvider.changeLoginToRegister();
                            },
                            child: Text(textTextButton))
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
