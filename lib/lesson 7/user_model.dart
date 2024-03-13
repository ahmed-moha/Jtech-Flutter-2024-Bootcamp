class UserModel{
  int? id;
  String? name;

  UserModel.fromJson(Map<String,dynamic> json){
    id=json["id"];
    name=json["name"];
  }
}