// To parse this JSON data, do
//
//     final marketOrderBookModel = marketOrderBookModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';

MarketOrderBookModel marketOrderBookModelFromJson(String str) => MarketOrderBookModel.fromJson(json.decode(str));

String marketOrderBookModelToJson(MarketOrderBookModel data) => json.encode(data.toJson());

class MarketOrderBookModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  MarketOrderBookModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory MarketOrderBookModel.fromJson(Map<String, dynamic> json) => MarketOrderBookModel(
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
  List<SideOrderBook>? sellSideOrders;
  List<SideOrderBook>? buySideOrders;

  Data({
    this.sellSideOrders,
    this.buySideOrders,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sellSideOrders: json["sell_side_orders"] == null ? [] : List<SideOrderBook>.from(json["sell_side_orders"]!.map((x) => SideOrderBook.fromJson(x))),
        buySideOrders: json["buy_side_orders"] == null ? [] : List<SideOrderBook>.from(json["buy_side_orders"]!.map((x) => SideOrderBook.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sell_side_orders": sellSideOrders == null ? [] : List<dynamic>.from(sellSideOrders!.map((x) => x.toJson())),
        "buy_side_orders": buySideOrders == null ? [] : List<dynamic>.from(buySideOrders!.map((x) => x.toJson())),
      };
}

class SideOrderBook {
  int? id;
  String? userId;
  String? pairId;
  String? coinId;
  String? marketCurrencyId;
  String? trx;
  String? orderSide;
  String? orderType;
  String? rate;
  String? price;
  String? amount;
  String? total;
  String? filledAmount;
  String? filedPercentage;
  String? charge;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? totalAmount;
  String? totalOrder;
  String? totalTrade;
  String? hasMyOrder;
  String? orderSideBadge;
  String? formattedDate;
  String? statusBadge;

  SideOrderBook({
    this.id,
    this.userId,
    this.pairId,
    this.coinId,
    this.marketCurrencyId,
    this.trx,
    this.orderSide,
    this.orderType,
    this.rate,
    this.price,
    this.amount,
    this.total,
    this.filledAmount,
    this.filedPercentage,
    this.charge,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.totalAmount,
    this.totalOrder,
    this.totalTrade,
    this.hasMyOrder,
    this.orderSideBadge,
    this.formattedDate,
    this.statusBadge,
  });

  factory SideOrderBook.fromJson(Map<String, dynamic> json) => SideOrderBook(
        id: json["id"],
        userId: json["user_id"].toString(),
        pairId: json["pair_id"].toString(),
        coinId: json["coin_id"].toString(),
        marketCurrencyId: json["market_currency_id"].toString(),
        trx: json["trx"].toString(),
        orderSide: json["order_side"].toString(),
        orderType: json["order_type"].toString(),
        rate: json["rate"].toString(),
        price: json["price"].toString(),
        amount: json["amount"].toString(),
        total: json["total"].toString(),
        filledAmount: json["filled_amount"].toString(),
        filedPercentage: json["filed_percentage"].toString(),
        charge: json["charge"].toString(),
        status: json["status"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        totalAmount: json["total_amount"].toString(),
        totalOrder: json["total_order"].toString(),
        totalTrade: json["total_trade"].toString(),
        hasMyOrder: json["has_my_order"].toString(),
        orderSideBadge: json["order_side_badge"].toString(),
        formattedDate: json["formatted_date"].toString(),
        statusBadge: json["status_badge"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "pair_id": pairId,
        "coin_id": coinId,
        "market_currency_id": marketCurrencyId,
        "trx": trx,
        "order_side": orderSide,
        "order_type": orderType,
        "rate": rate,
        "price": price,
        "amount": amount,
        "total": total,
        "filled_amount": filledAmount,
        "filed_percentage": filedPercentage,
        "charge": charge,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "total_amount": totalAmount,
        "total_order": totalOrder,
        "total_trade": totalTrade,
        "has_my_order": hasMyOrder,
        "order_side_badge": orderSideBadge,
        "formatted_date": formattedDate,
        "status_badge": statusBadge,
      };
}

