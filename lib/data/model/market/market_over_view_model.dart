
import 'dart:convert';
import '../auth/login/login_response_model.dart';
import 'market_data_list_model.dart';

MarketOverviewDataModel marketOverviewDataModelFromJson(String str) => MarketOverviewDataModel.fromJson(json.decode(str));

String marketOverviewDataModelToJson(MarketOverviewDataModel data) => json.encode(data.toJson());

class MarketOverviewDataModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  MarketOverviewDataModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory MarketOverviewDataModel.fromJson(Map<String, dynamic> json) => MarketOverviewDataModel(
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
  List<TopExchangesCoin>? topExchangesCoins;
  List<OverViewCoinModel>? highLightedCoins;
  List<OverViewCoinModel>? newCoins;

  Data({
    this.topExchangesCoins,
    this.highLightedCoins,
    this.newCoins,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        topExchangesCoins: json["top_exchanges_coins"] == null ? [] : List<TopExchangesCoin>.from(json["top_exchanges_coins"]!.map((x) => TopExchangesCoin.fromJson(x))),
        highLightedCoins: json["high_lighted_coins"] == null ? [] : List<OverViewCoinModel>.from(json["high_lighted_coins"]!.map((x) => OverViewCoinModel.fromJson(x))),
        newCoins: json["new_coins"] == null ? [] : List<OverViewCoinModel>.from(json["new_coins"]!.map((x) => OverViewCoinModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "top_exchanges_coins": topExchangesCoins == null ? [] : List<dynamic>.from(topExchangesCoins!.map((x) => x.toJson())),
        "high_lighted_coins": highLightedCoins == null ? [] : List<dynamic>.from(highLightedCoins!.map((x) => x.toJson())),
        "new_coins": newCoins == null ? [] : List<dynamic>.from(newCoins!.map((x) => x.toJson())),
      };
}

class OverViewCoinModel {
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
  MarketData? marketData;

  OverViewCoinModel({
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
    this.marketData,
  });

  factory OverViewCoinModel.fromJson(Map<String, dynamic> json) => OverViewCoinModel(
        id: json["id"],
        type: json["type"].toString(),
        name: json["name"].toString(),
        sign: json["sign"].toString(),
        symbol: json["symbol"].toString(),
        image: json["image".toString()],
        rate: json["rate"].toString(),
        rank: json["rank"].toString(),
        status: json["status"].toString(),
        highlightedCoin: json["highlighted_coin"].toString(),
        p2PSn: json["p2p_sn"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        imageUrl: json["image_url"].toString(),
        marketData: json["market_data"] == null ? null : MarketData.fromJson(json["market_data"]),
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
        "market_data": marketData?.toJson(),
      };
}

class TopExchangesCoin {
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
  String? totalExchangeAmount;
  String? orderSideBadge;
  String? formattedDate;
  String? statusBadge;
  OverViewCoinModel? coin;

  TopExchangesCoin({
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
    this.totalExchangeAmount,
    this.orderSideBadge,
    this.formattedDate,
    this.statusBadge,
    this.coin,
  });

  factory TopExchangesCoin.fromJson(Map<String, dynamic> json) => TopExchangesCoin(
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
        total: json["total"],
        filledAmount: json["filled_amount"].toString(),
        filedPercentage: json["filed_percentage"].toString(),
        charge: json["charge"].toString(),
        status: json["status"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        totalExchangeAmount: json["total_exchange_amount"].toString(),
        orderSideBadge: json["order_side_badge"].toString(),
        formattedDate: json["formatted_date"].toString(),
        statusBadge: json["status_badge"].toString(),
        coin: json["coin"] == null ? null : OverViewCoinModel.fromJson(json["coin"]),
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
        "total_exchange_amount": totalExchangeAmount,
        "order_side_badge": orderSideBadge,
        "formatted_date": formattedDate,
        "status_badge": statusBadge,
        "coin": coin?.toJson(),
      };
}
