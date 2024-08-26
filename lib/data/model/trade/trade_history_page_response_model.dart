// To parse this JSON data, do
//
//     final tradeHistoryPageResponseModel = tradeHistoryPageResponseModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';

TradeHistoryPageResponseModel tradeHistoryPageResponseModelFromJson(String str) => TradeHistoryPageResponseModel.fromJson(json.decode(str));

String tradeHistoryPageResponseModelToJson(TradeHistoryPageResponseModel data) => json.encode(data.toJson());

class TradeHistoryPageResponseModel {
  String? remark;
  String? status;
  Message? message;
  TradeHistoryPageData? data;

  TradeHistoryPageResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory TradeHistoryPageResponseModel.fromJson(Map<String, dynamic> json) => TradeHistoryPageResponseModel(
        remark: json["remark"],
        status: json["status"],
        message: json["message"] == null ? null : Message.fromJson(json["message"]),
        data: json["data"] == null ? null : TradeHistoryPageData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "remark": remark,
        "status": status,
        "message": message?.toJson(),
        "data": data?.toJson(),
      };
}

class TradeHistoryPageData {
  TradeHistoryList? trades;

  TradeHistoryPageData({
    this.trades,
  });

  factory TradeHistoryPageData.fromJson(Map<String, dynamic> json) => TradeHistoryPageData(
        trades: json["trades"] == null ? null : TradeHistoryList.fromJson(json["trades"]),
      );

  Map<String, dynamic> toJson() => {
        "trades": trades?.toJson(),
      };
}

class TradeHistoryList {
  String? currentPage;
  List<TradeHistoryPageListData>? data;

  String? nextPageUrl;
  String? path;

  TradeHistoryList({
    this.currentPage,
    this.data,
    this.nextPageUrl,
    this.path,
  });

  factory TradeHistoryList.fromJson(Map<String, dynamic> json) => TradeHistoryList(
        currentPage: json["current_page"].toString(),
        data: json["data"] == null ? [] : List<TradeHistoryPageListData>.from(json["data"]!.map((x) => TradeHistoryPageListData.fromJson(x))),
        nextPageUrl: json["next_page_url"].toString(),
        path: json["path"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
      };
}

class TradeHistoryPageListData {
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
  TradeHistoryPageListDataOrder? order;

  TradeHistoryPageListData({
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
    this.order,
  });

  factory TradeHistoryPageListData.fromJson(Map<String, dynamic> json) => TradeHistoryPageListData(
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
        order: json["order"] == null ? null : TradeHistoryPageListDataOrder.fromJson(json["order"]),
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
        "order": order?.toJson(),
      };
}

class TradeHistoryPageListDataOrder {
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
  TradeHistoryPageListDataOrderPair? pair;

  TradeHistoryPageListDataOrder({
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

  factory TradeHistoryPageListDataOrder.fromJson(Map<String, dynamic> json) => TradeHistoryPageListDataOrder(
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
        pair: json["pair"] == null ? null : TradeHistoryPageListDataOrderPair.fromJson(json["pair"]),
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

class TradeHistoryPageListDataOrderPair {
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
  TradeHistoryPageListDataOrderPairMarketCoin? coin;
  TradeHistoryPageListDataOrderPairMarket? market;

  TradeHistoryPageListDataOrderPair({
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

  factory TradeHistoryPageListDataOrderPair.fromJson(Map<String, dynamic> json) => TradeHistoryPageListDataOrderPair(
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
        coin: json["coin"] == null ? null : TradeHistoryPageListDataOrderPairMarketCoin.fromJson(json["coin"]),
        market: json["market"] == null ? null : TradeHistoryPageListDataOrderPairMarket.fromJson(json["market"]),
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

class TradeHistoryPageListDataOrderPairMarketCoin {
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

  TradeHistoryPageListDataOrderPairMarketCoin({
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

  factory TradeHistoryPageListDataOrderPairMarketCoin.fromJson(Map<String, dynamic> json) => TradeHistoryPageListDataOrderPairMarketCoin(
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

class TradeHistoryPageListDataOrderPairMarket {
  String? id;
  String? name;
  String? currencyId;
  String? status;
  String? createdAt;
  String? updatedAt;
  TradeHistoryPageListDataOrderPairMarketCoin? currency;

  TradeHistoryPageListDataOrderPairMarket({
    this.id,
    this.name,
    this.currencyId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.currency,
  });

  factory TradeHistoryPageListDataOrderPairMarket.fromJson(Map<String, dynamic> json) => TradeHistoryPageListDataOrderPairMarket(
        id: json["id"].toString(),
        name: json["name"].toString(),
        currencyId: json["currency_id"].toString(),
        status: json["status"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        currency: json["currency"] == null ? null : TradeHistoryPageListDataOrderPairMarketCoin.fromJson(json["currency"]),
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
