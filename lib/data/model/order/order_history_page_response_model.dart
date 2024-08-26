// To parse this JSON data, do
//
//     final orderHistoryPageResponseModel = orderHistoryPageResponseModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';

OrderHistoryPageResponseModel orderHistoryPageResponseModelFromJson(String str) => OrderHistoryPageResponseModel.fromJson(json.decode(str));

String orderHistoryPageResponseModelToJson(OrderHistoryPageResponseModel data) => json.encode(data.toJson());

class OrderHistoryPageResponseModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  OrderHistoryPageResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory OrderHistoryPageResponseModel.fromJson(Map<String, dynamic> json) => OrderHistoryPageResponseModel(
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
  List<OrderHistoryPageResponseModelData>? data;
  String? nextPageUrl;
  String? path;

  Orders({
    this.data,
    this.nextPageUrl,
    this.path,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        data: json["data"] == null ? [] : List<OrderHistoryPageResponseModelData>.from(json["data"]!.map((x) => OrderHistoryPageResponseModelData.fromJson(x))),
        nextPageUrl: json["next_page_url"].toString(),
        path: json["path"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
      };
}

class OrderHistoryPageResponseModelData {
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
  OrderHistoryPageResponseModelDataPair? pair;

  OrderHistoryPageResponseModelData({
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

  factory OrderHistoryPageResponseModelData.fromJson(Map<String, dynamic> json) => OrderHistoryPageResponseModelData(
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
        pair: json["pair"] == null ? null : OrderHistoryPageResponseModelDataPair.fromJson(json["pair"]),
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

class OrderHistoryPageResponseModelDataPair {
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
  OrderHistoryPageResponseModelDataPairCoin? coin;
  OrderHistoryPageResponseModelDataPairMarket? market;

  OrderHistoryPageResponseModelDataPair({
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
    this.coin,
    this.market,
  });

  factory OrderHistoryPageResponseModelDataPair.fromJson(Map<String, dynamic> json) => OrderHistoryPageResponseModelDataPair(
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
        coin: json["coin"] == null ? null : OrderHistoryPageResponseModelDataPairCoin.fromJson(json["coin"]),
        market: json["market"] == null ? null : OrderHistoryPageResponseModelDataPairMarket.fromJson(json["market"]),
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
        "coin": coin?.toJson(),
        "market": market?.toJson(),
      };
}

class OrderHistoryPageResponseModelDataPairCoin {
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

  OrderHistoryPageResponseModelDataPairCoin({
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

  factory OrderHistoryPageResponseModelDataPairCoin.fromJson(Map<String, dynamic> json) => OrderHistoryPageResponseModelDataPairCoin(
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

class OrderHistoryPageResponseModelDataPairMarket {
  String? id;
  String? name;
  String? currencyId;
  String? status;
  String? createdAt;
  String? updatedAt;
  OrderHistoryPageResponseModelDataPairCoin? currency;

  OrderHistoryPageResponseModelDataPairMarket({
    this.id,
    this.name,
    this.currencyId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.currency,
  });

  factory OrderHistoryPageResponseModelDataPairMarket.fromJson(Map<String, dynamic> json) => OrderHistoryPageResponseModelDataPairMarket(
        id: json["id"].toString(),
        name: json["name"].toString(),
        currencyId: json["currency_id"].toString(),
        status: json["status"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        currency: json["currency"] == null ? null : OrderHistoryPageResponseModelDataPairCoin.fromJson(json["currency"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "currency_id": currencyId,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "currency": currency?.toJson(),
      };
}
