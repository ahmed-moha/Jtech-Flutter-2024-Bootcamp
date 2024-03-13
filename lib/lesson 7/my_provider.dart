import 'package:flutter/material.dart';
import 'package:my_project/lesson%207/services.dart';
import 'package:my_project/lesson%207/user_model.dart';

class MyProvider extends ChangeNotifier {
  int count = 0;
  List<UserModel> users = [];
  bool isLoading = false;

  increament() {
    count++;
    notifyListeners();
  }

  loadUsers() async {
    try {
      isLoading = true;
      notifyListeners();

      users = await Services().getUsers();
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  deleteUser(UserModel user) {
    users.removeWhere((element) => element.id == user.id);
    notifyListeners();
  }
}
