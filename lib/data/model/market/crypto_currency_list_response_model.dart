// To parse this JSON data, do
//
//     final cryptoCurrencyListResponseModel = cryptoCurrencyListResponseModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';

CryptoCurrencyListResponseModel cryptoCurrencyListResponseModelFromJson(String str) => CryptoCurrencyListResponseModel.fromJson(json.decode(str));

String cryptoCurrencyListResponseModelToJson(CryptoCurrencyListResponseModel data) => json.encode(data.toJson());

class CryptoCurrencyListResponseModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  CryptoCurrencyListResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory CryptoCurrencyListResponseModel.fromJson(Map<String, dynamic> json) => CryptoCurrencyListResponseModel(
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
  List<CryptoCurrencyData>? currencies;
  int? total;

  Data({
    this.currencies,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currencies: json["currencies"] == null ? [] : List<CryptoCurrencyData>.from(json["currencies"]!.map((x) => CryptoCurrencyData.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "currencies": currencies == null ? [] : List<dynamic>.from(currencies!.map((x) => x.toJson())),
        "total": total,
      };
}

class CryptoCurrencyData {
  String? id;
  String? type;
  String? name;
  String? sign;
  String? symbol;
  String? image;
  String? rate;
  String? rank;
  String? status;
  String? highlightedCoin;
  String? p2PSn;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  CryptoCurrencyData({
    this.id,
    this.type,
    this.name,
    this.sign,
    this.symbol,
    this.image,
    this.rate,
    this.rank,
    this.status,
    this.highlightedCoin,
    this.p2PSn,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
  });

  factory CryptoCurrencyData.fromJson(Map<String, dynamic> json) => CryptoCurrencyData(
        id: json["id"].toString(),
        type: json["type"].toString(),
        name: json["name"].toString(),
        sign: json["sign"].toString(),
        symbol: json["symbol"].toString(),
        image: json["image"].toString(),
        rate: json["rate"].toString(),
        rank: json["rank"].toString(),
        status: json["status"].toString(),
        highlightedCoin: json["highlighted_coin"].toString(),
        p2PSn: json["p2p_sn"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        imageUrl: json["image_url"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "sign": sign,
        "symbol": symbol,
        "image": image,
        "rate": rate,
        "rank": rank,
        "status": status,
        "highlighted_coin": highlightedCoin,
        "p2p_sn": p2PSn,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "image_url": imageUrl,
      };
}
