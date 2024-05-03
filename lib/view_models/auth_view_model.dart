import 'package:flutter/material.dart';
import 'package:swifty_text_flutter/models/user.model.dart';

class AuthViewModel extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  Future<void> login(String username, String password) async {
    // simulate login
    _user = User(id: 1, email: "admin@gmail.com", username: "Admin");
    notifyListeners();
  }
}
