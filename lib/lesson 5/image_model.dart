class ImageModel {
  String? imageUrl;

  ImageModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json["imageUrl"];
  }
}
