// To parse this JSON data, do
//
//     final blogScreenResponseModel = blogScreenResponseModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';

BlogScreenResponseModel blogScreenResponseModelFromJson(String str) => BlogScreenResponseModel.fromJson(json.decode(str));

String blogScreenResponseModelToJson(BlogScreenResponseModel data) => json.encode(data.toJson());

class BlogScreenResponseModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  BlogScreenResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory BlogScreenResponseModel.fromJson(Map<String, dynamic> json) => BlogScreenResponseModel(
        remark: json["remark"].toString(),
        status: json["status"].toString(),
        message: json["message"] == null ? null : Message.fromJson(json["message"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "remark": remark,
        "status": status,
        "message": message?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  Blogs? blogs;
  String? path;
  Data({
    this.blogs,
    this.path,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        blogs: json["blogs"] == null ? null : Blogs.fromJson(json["blogs"]),
        path: json["path"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "blogs": blogs?.toJson(),
        "path": path,
      };
}

class Blogs {
  List<BlogData>? data;
  String? path;
  String? nextPageUrl;

  Blogs({
    this.data,
    this.path,
    this.nextPageUrl,
  });

  factory Blogs.fromJson(Map<String, dynamic> json) => Blogs(
        data: json["data"] == null ? [] : List<BlogData>.from(json["data"]!.map((x) => BlogData.fromJson(x))),
        nextPageUrl: json["next_page_url"].toString(),
        path: json["path"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
      };
}

class BlogData {
  String? id;
  String? dataKeys;
  DataValues? dataValues;
  String? tempname;
  String? createdAt;
  String? updatedAt;

  BlogData({
    this.id,
    this.dataKeys,
    this.dataValues,
    this.tempname,
    this.createdAt,
    this.updatedAt,
  });

  factory BlogData.fromJson(Map<String, dynamic> json) => BlogData(
        id: json["id"].toString(),
        dataKeys: json["data_keys"].toString(),
        dataValues: json["data_values"] == null ? null : DataValues.fromJson(json["data_values"]),
        tempname: json["tempname"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "data_keys": dataKeys,
        "data_values": dataValues?.toJson(),
        "tempname": tempname,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class DataValues {
  List<String>? hasImage;
  String? title;
  String? descriptionNic;
  String? image;

  DataValues({
    this.hasImage,
    this.title,
    this.descriptionNic,
    this.image,
  });

  factory DataValues.fromJson(Map<String, dynamic> json) => DataValues(
        hasImage: json["has_image"] == null ? [] : List<String>.from(json["has_image"]!.map((x) => x)),
        title: json["title"].toString(),
        descriptionNic: json["description_nic"].toString(),
        image: json["image"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "has_image": hasImage == null ? [] : List<dynamic>.from(hasImage!.map((x) => x)),
        "title": title,
        "description_nic": descriptionNic,
        "image": image,
      };
}
