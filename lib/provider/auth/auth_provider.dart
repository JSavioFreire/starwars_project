import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? users;
  bool usersLoading = false;
  bool isLoading = true;

  AuthProvider() {
    authCheck();
  }

  authCheck() {
    auth.authStateChanges().listen((User? user) {
      users = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  getUser() {
    users = auth.currentUser;
    notifyListeners();
  }

  login(String email, String password) async {
    try {
      usersLoading = true;
      await auth.signInWithEmailAndPassword(email: email, password: password);
      getUser();
      usersLoading = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Seu email não foi encontrado.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente.');
      }
    }
  }

  register(String email, String password, String name) async {
    try {
      usersLoading = true;
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await users!.updateDisplayName(name);
      getUser();
      usersLoading = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado');
      } else if (e.code == 'invalid-email') {
        throw AuthException('Este email não é válido');
      }
    }
  }

  logout() async {
    await auth.signOut();
    getUser();
  }
}

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}
