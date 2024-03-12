import "dart:convert";

import "package:http/http.dart" as http;
import "package:my_project/lesson%206/data_model.dart";

class Services {
  getPosts() async {
    var response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/post")
    );

    if (response.statusCode == 200) {
      print(response.body);
      final json = jsonDecode(response.body);

      List data = json;

      return data.map((e) => DataModel.fromJson(e)).toList();
    }
  }
}
