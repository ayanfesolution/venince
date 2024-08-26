// To parse this JSON data, do
//
//     final dashboardResponseModel = dashboardResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:vinance/data/model/auth/login/login_response_model.dart';

import '../user/user_model.dart';

DashboardResponseModel dashboardResponseModelFromJson(String str) => DashboardResponseModel.fromJson(json.decode(str));

String dashboardResponseModelToJson(DashboardResponseModel data) => json.encode(data.toJson());

class DashboardResponseModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  DashboardResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory DashboardResponseModel.fromJson(Map<String, dynamic> json) => DashboardResponseModel(
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
  User? user;
  List<Currency>? currencies;
  String? estimatedBalance;

  Data({
    this.user,
    this.currencies,
    this.estimatedBalance,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        currencies: json["currencies"] == null ? [] : List<Currency>.from(json["currencies"]!.map((x) => Currency.fromJson(x))),
        estimatedBalance: json["estimated_balance"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "currencies": currencies == null ? [] : List<dynamic>.from(currencies!.map((x) => x.toJson())),
        "estimated_balance": estimatedBalance,
      };
}

class Currency {
  String? name;
  String? id;
  String? symbol;
  String? imageUrl;

  Currency({
    this.name,
    this.id,
    this.symbol,
    this.imageUrl,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        name: json["name"].toString(),
        id: json["id"].toString(),
        symbol: json["symbol"].toString(),
        imageUrl: json["image_url"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "symbol": symbol,
        "image_url": imageUrl,
      };
}
