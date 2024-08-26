// To parse this JSON data, do
//
//     final tradeHistoryResponseModel = tradeHistoryResponseModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';

TradeHistoryResponseModel tradeHistoryResponseModelFromJson(String str) => TradeHistoryResponseModel.fromJson(json.decode(str));

String tradeHistoryResponseModelToJson(TradeHistoryResponseModel data) => json.encode(data.toJson());

class TradeHistoryResponseModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  TradeHistoryResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory TradeHistoryResponseModel.fromJson(Map<String, dynamic> json) => TradeHistoryResponseModel(
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
  List<TradeHistoryData>? trades;

  Data({
    this.trades,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        trades: json["trades"] == null ? [] : List<TradeHistoryData>.from(json["trades"]!.map((x) => TradeHistoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "trades": trades == null ? [] : List<dynamic>.from(trades!.map((x) => x.toJson())),
      };
}

class TradeHistoryData {
  String? id;
  String? orderId;
  String? pairId;
  String? traderId;
  String? tradeSide;
  String? rate;
  String? amount;
  String? total;
  String? charge;
  String? createdAt;
  String? updatedAt;
  String? formattedDate;

  TradeHistoryData({
    this.id,
    this.orderId,
    this.pairId,
    this.traderId,
    this.tradeSide,
    this.rate,
    this.amount,
    this.total,
    this.charge,
    this.createdAt,
    this.updatedAt,
    this.formattedDate,
  });

  factory TradeHistoryData.fromJson(Map<String, dynamic> json) => TradeHistoryData(
        id: json["id"].toString(),
        orderId: json["order_id"].toString(),
        pairId: json["pair_id"].toString(),
        traderId: json["trader_id"].toString(),
        tradeSide: json["trade_side"].toString(),
        rate: json["rate"].toString(),
        amount: json["amount"].toString(),
        total: json["total"].toString(),
        charge: json["charge"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        formattedDate: json["formatted_date"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "pair_id": pairId,
        "trader_id": traderId,
        "trade_side": tradeSide,
        "rate": rate,
        "amount": amount,
        "total": total,
        "charge": charge,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "formatted_date": formattedDate,
      };
}
