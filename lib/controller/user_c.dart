import 'package:flutter/material.dart';
import 'package:internsuitmedia_palindromecheck/model/usermodel.dart';

class UserController {
  final UserModel _model = UserModel();
  final TextEditingController nameController = TextEditingController();

  Future<List<User>> fetchUsers() async {
    return await _model.fetchUsers();
  }

  void onUserTap(BuildContext context, User user) {
    Navigator.pop(context, user);
  }

  void updateUserName(String userName) {
    nameController.text = userName;
  }
}
