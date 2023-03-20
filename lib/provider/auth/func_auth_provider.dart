import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

class FuncAuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool buttonInLoading = false;
  bool isRegister = false;

  void changeLoginToRegister() {
    isRegister = !isRegister;
    notifyListeners();
  }

  void login(
      {required BuildContext context,
      required TextEditingController email,
      required TextEditingController password}) async {
    buttonInLoading = true;
    notifyListeners();
    try {
      await context.read<AuthProvider>().login(email.text, password.text);
      buttonInLoading = false;
      notifyListeners();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            e.message,
          )));
      buttonInLoading = false;
      notifyListeners();
    }
  }

  void register(
      {required BuildContext context,
      required email,
      required password,
      required name}) async {
    buttonInLoading = true;
    notifyListeners();

    try {
      await context
          .read<AuthProvider>()
          .register(email.text, password.text, name.text);
      buttonInLoading = false;

      notifyListeners();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
      buttonInLoading = false;
      notifyListeners();
    }
  }
}
