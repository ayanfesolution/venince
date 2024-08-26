// To parse this JSON data, do
//
//     final onBoards = onBoardsFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';

OnBoardResponseModel onBoardsFromJson(String str) => OnBoardResponseModel.fromJson(json.decode(str));

String onBoardsToJson(OnBoardResponseModel data) => json.encode(data.toJson());

class OnBoardResponseModel {
    String? remark;
    String? status;
    Message? message;
    Data? data;

    OnBoardResponseModel({
        this.remark,
        this.status,
        this.message,
        this.data,
    });

    factory OnBoardResponseModel.fromJson(Map<String, dynamic> json) => OnBoardResponseModel(
        remark: json["remark"],
        status: json["status"],
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
    List<OnBoard>? onBoards;
    String? imagePath;

    Data({
        this.onBoards,
        this.imagePath,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        onBoards: json["onboardings"] == null ? [] : List<OnBoard>.from(json["onboardings"]!.map((x) => OnBoard.fromJson(x))),
        imagePath: json["path"],
    );

    Map<String, dynamic> toJson() => {
        "onboardings": onBoards == null ? [] : List<dynamic>.from(onBoards!.map((x) => x.toJson())),
        "path": imagePath,
    };
}

class OnBoard {
    String? id;
    String? dataKeys;
    DataValues? dataValues;
    String? tempname;
    String? createdAt;
    String? updatedAt;

    OnBoard({
        this.id,
        this.dataKeys,
        this.dataValues,
        this.tempname,
        this.createdAt,
        this.updatedAt,
    });

    factory OnBoard.fromJson(Map<String, dynamic> json) => OnBoard(
        id: json["id"].toString(),
        dataKeys: json["data_keys"].toString(),
        dataValues: json["data_values"] == null ? null : DataValues.fromJson(json["data_values"]),
        tempname: json["tempname"].toString(),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
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
 String? title;
    String? subtitle;
    String? hasImage;
    String? image;


    DataValues({
        this.title,
        this.subtitle,
        this.hasImage,
        this.image,
    });

    factory DataValues.fromJson(Map<String, dynamic> json) => DataValues(
        title: json["title"].toString(),
        subtitle: json["subtitle"].toString(),
        hasImage: json["has_image"].toString(),
        image: json["image"].toString(),
    );

    Map<String, dynamic> toJson() => {
         "title": title,
        "subtitle": subtitle,
        "has_image": hasImage,
        "image": image,
    };
}
