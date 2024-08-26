// To parse this JSON data, do
//
//     final marketDataListModel = marketDataListModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';
import 'market_trade_deatils_model.dart';

MarketDataListModel marketDataListModelFromJson(String str) => MarketDataListModel.fromJson(json.decode(str));

String marketDataListModelToJson(MarketDataListModel data) => json.encode(data.toJson());

class MarketDataListModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  MarketDataListModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory MarketDataListModel.fromJson(Map<String, dynamic> json) => MarketDataListModel(
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
  int? total;

  Data({
    this.pairs,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pairs: json["pairs"] == null ? null : Pairs.fromJson(json["pairs"]),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "pairs": pairs?.toJson(),
        "total": total,
      };
}

class Pairs {
  String? currentPage;
  List<MarketPairSingleData>? data;
  String? firstPageUrl;
  String? lastPage;
  dynamic nextPageUrl;
  String? total;

  Pairs({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.lastPage,
    this.nextPageUrl,
    this.total,
  });

  factory Pairs.fromJson(Map<String, dynamic> json) => Pairs(
        currentPage: json["current_page"].toString(),
        data: json["data"] == null ? [] : List<MarketPairSingleData>.from(json["data"]!.map((x) => MarketPairSingleData.fromJson(x))),
        lastPage: json["last_page"].toString(),
        nextPageUrl: json["next_page_url"].toString(),
        total: json["total"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "last_page": lastPage,
        "next_page_url": nextPageUrl,
        "total": total,
      };
}

class MarketPairSingleData {
  int? id;
  String? marketId;
  String? coinId;
  String? symbol;
  String? totalTrade;
  PairMarket? market;
  PairCoin? coin;
  MarketData? marketData;

  MarketPairSingleData({
    this.id,
    this.marketId,
    this.coinId,
    this.symbol,
    this.totalTrade,
    this.market,
    this.coin,
    this.marketData,
  });

  factory MarketPairSingleData.fromJson(Map<String, dynamic> json) => MarketPairSingleData(
        id: json["id"],
        marketId: json["market_id"].toString(),
        coinId: json["coin_id"].toString(),
        symbol: json["symbol"].toString(),
        totalTrade: json["total_trade"].toString(),
        market: json["market"] == null ? null : PairMarket.fromJson(json["market"]),
        coin: json["coin"] == null ? null : PairCoin.fromJson(json["coin"]),
        marketData: json["market_data"] == null ? null : MarketData.fromJson(json["market_data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "market_id": marketId,
        "coin_id": coinId,
        "symbol": symbol,
        "total_trade": totalTrade,
        "market": market?.toJson(),
        "coin": coin?.toJson(),
        "market_data": marketData?.toJson(),
      };
}

class MarketData {
  String? id;
  String? currencyId;
  String? symbol;
  String? pairId;
  String? price;
  String? lastPrice;
  String? marketCap;
  String? lastMarketCap;
  String? percentChange1H;
  String? lastPercentChange1H;
  String? percentChange24H;
  String? lastPercentChange24H;
  String? percentChange7D;
  String? lastPercentChange7D;
  String? volume24H;
  HtmlClasses? htmlClasses;
  String? createdAt;
  String? updatedAt;

  MarketData({
    this.id,
    this.currencyId,
    this.symbol,
    this.pairId,
    this.price,
    this.lastPrice,
    this.marketCap,
    this.lastMarketCap,
    this.percentChange1H,
    this.lastPercentChange1H,
    this.percentChange24H,
    this.lastPercentChange24H,
    this.percentChange7D,
    this.lastPercentChange7D,
    this.volume24H,
    this.htmlClasses,
    this.createdAt,
    this.updatedAt,
  });

  factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
        id: json["id"].toString(),
        currencyId: json["currency_id"].toString(),
        symbol: json["symbol"].toString(),
        pairId: json["pair_id"].toString(),
        price: json["price"].toString(),
        lastPrice: json["last_price"].toString(),
        marketCap: json["market_cap"].toString(),
        lastMarketCap: json["last_market_cap"].toString(),
        percentChange1H: json["percent_change_1h"].toString(),
        lastPercentChange1H: json["last_percent_change_1h"].toString(),
        percentChange24H: json["percent_change_24h"].toString(),
        lastPercentChange24H: json["last_percent_change_24h"].toString(),
        percentChange7D: json["percent_change_7d"].toString(),
        lastPercentChange7D: json["last_percent_change_7d"].toString(),
        volume24H: json["volume_24h"].toString(),
        htmlClasses: json["html_classes"] == null ? null : HtmlClasses.fromJson(json["html_classes"]),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "currency_id": currencyId,
        "symbol": symbol,
        "pair_id": pairId,
        "price": price,
        "last_price": lastPrice,
        "market_cap": marketCap,
        "last_market_cap": lastMarketCap,
        "percent_change_1h": percentChange1H,
        "last_percent_change_1h": lastPercentChange1H,
        "percent_change_24h": percentChange24H,
        "last_percent_change_24h": lastPercentChange24H,
        "percent_change_7d": percentChange7D,
        "last_percent_change_7d": lastPercentChange7D,
        "volume_24h": volume24H,
        "html_classes": htmlClasses?.toJson(),
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class HtmlClasses {
  String? priceChange;
  String? percentChange1H;
  String? percentChange24H;
  String? percentChange7D;

  HtmlClasses({
    this.priceChange,
    this.percentChange1H,
    this.percentChange24H,
    this.percentChange7D,
  });

  factory HtmlClasses.fromJson(Map<String, dynamic> json) => HtmlClasses(
        priceChange: json["price_change"].toString(),
        percentChange1H: json["percent_change_1h"].toString(),
        percentChange24H: json["percent_change_24h"].toString(),
        percentChange7D: json["percent_change_7d"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "price_change": priceChange,
        "percent_change_1h": percentChange1H,
        "percent_change_24h": percentChange24H,
        "percent_change_7d": percentChange7D,
      };
}

