import 'dart:convert';

List<ImageModel> imageModelFromJson(String str) =>
    List<ImageModel>.from(json.decode(str).map((x) => ImageModel.fromJson(x)));

class ImageModel {
  String id;
  Url urls;
  User user;

  ImageModel({required this.id, required this.urls, required this.user});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      urls: Url.fromJson(json["urls"]),
      user: User.fromJson(json["user"]),
    );
  }
}

class User {
  String name;

  User({required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["username"] as String,
    );
  }
}

class Url {
  String urlSmall;
  String urlBig;

  Url({required this.urlSmall, required this.urlBig});

  factory Url.fromJson(Map<String, dynamic> json) {
    return Url(
      urlSmall: json["small"] as String,
      urlBig: json["full"] as String,
    );
  }
}
