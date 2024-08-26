// To parse this JSON data, do
//
//     final marketTradeDetailsModel = marketTradeDetailsModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';
import 'market_data_list_model.dart';
import 'market_page_currency_list_model.dart';

MarketTradeDetailsModel marketTradeDetailsModelFromJson(String str) => MarketTradeDetailsModel.fromJson(json.decode(str));

String marketTradeDetailsModelToJson(MarketTradeDetailsModel data) => json.encode(data.toJson());

class MarketTradeDetailsModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  MarketTradeDetailsModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory MarketTradeDetailsModel.fromJson(Map<String, dynamic> json) => MarketTradeDetailsModel(
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
  Pair? pair;
  String? isFavorite;
  List<CurrencyMarket>? markets;
  Wallet? coinWallet;
  Wallet? marketCurrencyWallet;
  List<Gateway>? gateways;

  Data({
    this.pair,
    this.markets,
    this.isFavorite,
    this.coinWallet,
    this.marketCurrencyWallet,
    this.gateways,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pair: json["pair"] == null ? null : Pair.fromJson(json["pair"]),
        isFavorite: json["is_favorite"].toString(),
        markets: json["markets"] == null ? [] : List<CurrencyMarket>.from(json["markets"]!.map((x) => CurrencyMarket.fromJson(x))),
        coinWallet: json["coin_wallet"] == null ? null : Wallet.fromJson(json["coin_wallet"]),
        marketCurrencyWallet: json["market_currency_wallet"] == null ? null : Wallet.fromJson(json["market_currency_wallet"]),
        gateways: json["gateways"] == null ? [] : List<Gateway>.from(json["gateways"]!.map((x) => Gateway.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pair": pair?.toJson(),
        "is_favorite": isFavorite,
        "markets": markets == null ? [] : List<dynamic>.from(markets!.map((x) => x.toJson())),
        "coin_wallet": coinWallet?.toJson(),
        "market_currency_wallet": marketCurrencyWallet?.toJson(),
        "gateways": gateways == null ? [] : List<dynamic>.from(gateways!.map((x) => x.toJson())),
      };
}

class Wallet {
  int? id;
  String? userId;
  String? currencyId;
  String? balance;
  String? walletType;
  String? createdAt;
  String? updatedAt;
  WalletCurrencyData? currency;
  Wallet({
    this.id,
    this.userId,
    this.currencyId,
    this.balance,
    this.walletType,
    this.createdAt,
    this.updatedAt,
    this.currency,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        userId: json["user_id"].toString(),
        currencyId: json["currency_id"].toString(),
        balance: json["balance"].toString(),
        walletType: json["wallet_type"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        currency: json["currency"] == null ? null : WalletCurrencyData.fromJson(json["currency"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "currency_id": currencyId,
        "balance": balance,
        "wallet_type": walletType,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "currency": currency?.toJson(),
      };
}

class WalletCurrencyData {
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

  WalletCurrencyData({
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

  factory WalletCurrencyData.fromJson(Map<String, dynamic> json) => WalletCurrencyData(
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

class Gateway {
  int? id;
  String? name;
  String? currency;
  String? symbol;
  String? methodCode;
  String? gatewayAlias;
  String? minAmount;
  String? maxAmount;
  String? percentCharge;
  String? fixedCharge;
  String? rate;
  String? image;
  String? createdAt;
  String? updatedAt;
  Method? method;

  Gateway({
    this.id,
    this.name,
    this.currency,
    this.symbol,
    this.methodCode,
    this.gatewayAlias,
    this.minAmount,
    this.maxAmount,
    this.percentCharge,
    this.fixedCharge,
    this.rate,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.method,
  });

  factory Gateway.fromJson(Map<String, dynamic> json) => Gateway(
        id: json["id"],
        name: json["name"].toString(),
        currency: json["currency"].toString(),
        symbol: json["symbol"].toString(),
        methodCode: json["method_code"].toString(),
        gatewayAlias: json["gateway_alias"].toString(),
        minAmount: json["min_amount"].toString(),
        maxAmount: json["max_amount"].toString(),
        percentCharge: json["percent_charge"].toString(),
        fixedCharge: json["fixed_charge"].toString(),
        rate: json["rate"].toString(),
        image: json["image"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        method: json["method"] == null ? null : Method.fromJson(json["method"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "currency": currency,
        "symbol": symbol,
        "method_code": methodCode,
        "gateway_alias": gatewayAlias,
        "min_amount": minAmount,
        "max_amount": maxAmount,
        "percent_charge": percentCharge,
        "fixed_charge": fixedCharge,
        "rate": rate,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "method": method?.toJson(),
      };
}

class Method {
  int? id;
  String? code;
  String? crypto;

  Method({
    this.id,
    this.code,
    this.crypto,
  });

  factory Method.fromJson(Map<String, dynamic> json) => Method(
        id: json["id"],
        code: json["code"].toString(),
        crypto: json["crypto"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "crypto": crypto,
      };
}

class Pair {
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
  PairMarket? market;
  PairCoin? coin;
  MarketData? marketData;

  Pair({
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
    this.market,
    this.coin,
    this.marketData,
  });

  factory Pair.fromJson(Map<String, dynamic> json) => Pair(
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
        market: json["market"] == null ? null : PairMarket.fromJson(json["market"]),
        coin: json["coin"] == null ? null : PairCoin.fromJson(json["coin"]),
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
        "market": market?.toJson(),
        "coin": coin?.toJson(),
        "market_data": marketData?.toJson(),
      };
}

class PairCoin {
  int? id;
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

  PairCoin({
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

  factory PairCoin.fromJson(Map<String, dynamic> json) => PairCoin(
        id: json["id"],
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

class PairMarket {
  int? id;
  String? name;
  String? currencyId;
  String? status;
  String? createdAt;
  String? updatedAt;
  PairCoin? currency;

  PairMarket({
    this.id,
    this.name,
    this.currencyId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.currency,
  });

  factory PairMarket.fromJson(Map<String, dynamic> json) => PairMarket(
        id: json["id"],
        name: json["name"].toString(),
        currencyId: json["currency_id"].toString(),
        status: json["status"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        currency: json["currency"] == null ? null : PairCoin.fromJson(json["currency"]),
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
