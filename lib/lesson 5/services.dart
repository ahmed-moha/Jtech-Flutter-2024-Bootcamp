import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_project/lesson%205/image_model.dart';

class Services {
  getData() async {
    var response = await rootBundle.loadString("images/data.json");
    List data = jsonDecode(response);
    return data.map((e) => ImageModel.fromJson(e)).toList();
  }
}
