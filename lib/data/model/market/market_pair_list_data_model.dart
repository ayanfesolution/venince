
import 'dart:convert';

import '../auth/login/login_response_model.dart';
import 'market_data_list_model.dart';
import 'market_trade_deatils_model.dart';

MarketPairListDataModel marketPairListDataModelFromJson(String str) => MarketPairListDataModel.fromJson(json.decode(str));

String marketPairListDataModelToJson(MarketPairListDataModel data) => json.encode(data.toJson());

class MarketPairListDataModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  MarketPairListDataModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory MarketPairListDataModel.fromJson(Map<String, dynamic> json) => MarketPairListDataModel(
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
  Pairs? pairs;
  List<String>? favoritePairId;

  Data({
    this.pairs,
    this.favoritePairId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pairs: json["pairs"] == null ? null : Pairs.fromJson(json["pairs"]),
        favoritePairId: json["favoritePairId"] == null ? [] : List<String>.from(json["favoritePairId"]!.map((x) => x.toString())),
      );

  Map<String, dynamic> toJson() => {
        "pairs": pairs?.toJson(),
        "favoritePairId": favoritePairId == null ? [] : List<String>.from(favoritePairId!.map((x) => x.toString())),
      };
}

class Pairs {
  String? currentPage;
  List<MarketSinglePairData>? data;

  String? from;
  String? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  String? perPage;

  String? to;
  String? total;

  Pairs({
    this.currentPage,
    this.data,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Pairs.fromJson(Map<String, dynamic> json) => Pairs(
        currentPage: json["current_page"].toString(),
        data: json["data"] == null ? [] : List<MarketSinglePairData>.from(json["data"]!.map((x) => MarketSinglePairData.fromJson(x))),
        lastPage: json["last_page"].toString(),
        lastPageUrl: json["last_page_url"].toString(),
        nextPageUrl: json["next_page_url"].toString(),
        total: json["total"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class MarketSinglePairData {
  int? id;
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
  PairCoin? coin;
  PairMarket? market;
  MarketData? marketData;

  MarketSinglePairData({
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
    this.marketData,
  });

  factory MarketSinglePairData.fromJson(Map<String, dynamic> json) => MarketSinglePairData(
        id: json["id"],
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
        coin: json["coin"] == null ? null : PairCoin.fromJson(json["coin"]),
        market: json["market"] == null ? null : PairMarket.fromJson(json["market"]),
        marketData: json["market_data"] == null ? null : MarketData.fromJson(json["market_data"]),
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
        "market_data": marketData?.toJson(),
      };
}
