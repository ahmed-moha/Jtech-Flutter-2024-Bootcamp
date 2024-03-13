import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_project/lesson%207/user_model.dart';

class Services {
  getUsers() async {
    var response = await rootBundle.loadString("images/users.json");
    List data = jsonDecode(response);

    return data.map((e) => UserModel.fromJson(e)).toList();
  }
}
