// To parse this JSON data, do
//
//     final unverifiedResponseModel = unverifiedResponseModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';

UnverifiedResponseModel unverifiedResponseModelFromJson(String str) => UnverifiedResponseModel.fromJson(json.decode(str));

String unverifiedResponseModelToJson(UnverifiedResponseModel data) => json.encode(data.toJson());

class UnverifiedResponseModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  UnverifiedResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory UnverifiedResponseModel.fromJson(Map<String, dynamic> json) => UnverifiedResponseModel(
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
  String? isBan;
  String? emailVerified;
  String? mobileVerified;
  String? twofaVerified;

  Data({
    this.isBan,
    this.emailVerified,
    this.mobileVerified,
    this.twofaVerified,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        isBan: json["is_ban"].toString(),
        emailVerified: json["email_verified"].toString(),
        mobileVerified: json["mobile_verified"].toString(),
        twofaVerified: json["twofa_verified"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "is_ban": isBan.toString(),
        "email_verified": emailVerified.toString(),
        "mobile_verified": mobileVerified.toString(),
        "twofa_verified": twofaVerified.toString(),
      };
}

