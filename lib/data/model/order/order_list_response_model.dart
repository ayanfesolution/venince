// To parse this JSON data, do
//
//     final orderListResponseModel = orderListResponseModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';

OrderListResponseModel orderListResponseModelFromJson(String str) => OrderListResponseModel.fromJson(json.decode(str));

String orderListResponseModelToJson(OrderListResponseModel data) => json.encode(data.toJson());

class OrderListResponseModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  OrderListResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory OrderListResponseModel.fromJson(Map<String, dynamic> json) => OrderListResponseModel(
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
  Orders? orders;

  Data({
    this.orders,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orders: json["orders"] == null ? null : Orders.fromJson(json["orders"]),
      );

  Map<String, dynamic> toJson() => {
        "orders": orders?.toJson(),
      };
}

class Orders {
  List<OrderListSingleData>? data;

  String? nextPageUrl;

  Orders({
    this.data,
    this.nextPageUrl,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        data: json["data"] == null ? [] : List<OrderListSingleData>.from(json["data"]!.map((x) => OrderListSingleData.fromJson(x))),
        nextPageUrl: json["next_page_url"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
      };
}

class OrderListSingleData {
  String? id;
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
  String? orderSideBadge;
  String? formattedDate;
  String? statusBadge;
  OrderDataPair? pair;

  OrderListSingleData({
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
    this.orderSideBadge,
    this.formattedDate,
    this.statusBadge,
    this.pair,
  });

  factory OrderListSingleData.fromJson(Map<String, dynamic> json) => OrderListSingleData(
        id: json["id"].toString(),
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
        orderSideBadge: json["order_side_badge"].toString(),
        formattedDate: json["formatted_date"].toString(),
        statusBadge: json["status_badge"].toString(),
        pair: json["pair"] == null ? null : OrderDataPair.fromJson(json["pair"]),
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
        "order_side_badge": orderSideBadge,
        "formatted_date": formattedDate,
        "status_badge": statusBadge,
        "pair": pair?.toJson(),
      };
}

class OrderDataPair {
  String? id;
  String? listedMarketName;
  String? symbol;
  String? marketId;
  String? coinId;
  String? price;
  String? minimumBuyAmount;
  String? maximumBuyAmount;
  String? minimumSellAmount;
  String? maximumSellAmount;
  String? percentChargeForSell;
  String? percentChargeForBuy;
  String? status;
  String? isDefault;
  String? createdAt;
  String? updatedAt;

  OrderDataPair({
    this.id,
    this.listedMarketName,
    this.symbol,
    this.marketId,
    this.coinId,
    this.price,
    this.minimumBuyAmount,
    this.maximumBuyAmount,
    this.minimumSellAmount,
    this.maximumSellAmount,
    this.percentChargeForSell,
    this.percentChargeForBuy,
    this.status,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderDataPair.fromJson(Map<String, dynamic> json) => OrderDataPair(
        id: json["id"].toString(),
        listedMarketName: json["listed_market_name"].toString(),
        symbol: json["symbol"].toString(),
        marketId: json["market_id"].toString(),
        coinId: json["coin_id"].toString(),
        price: json["price"].toString(),
        minimumBuyAmount: json["minimum_buy_amount"].toString(),
        maximumBuyAmount: json["maximum_buy_amount"].toString(),
        minimumSellAmount: json["minimum_sell_amount"].toString(),
        maximumSellAmount: json["maximum_sell_amount"].toString(),
        percentChargeForSell: json["percent_charge_for_sell"].toString(),
        percentChargeForBuy: json["percent_charge_for_buy"].toString(),
        status: json["status"].toString(),
        isDefault: json["is_default"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "listed_market_name": listedMarketName,
        "symbol": symbol,
        "market_id": marketId,
        "coin_id": coinId,
        "price": price,
        "minimum_buy_amount": minimumBuyAmount,
        "maximum_buy_amount": maximumBuyAmount,
        "minimum_sell_amount": minimumSellAmount,
        "maximum_sell_amount": maximumSellAmount,
        "percent_charge_for_sell": percentChargeForSell,
        "percent_charge_for_buy": percentChargeForBuy,
        "status": status,
        "is_default": isDefault,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
