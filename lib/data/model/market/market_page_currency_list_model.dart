
import 'dart:convert';

import '../auth/login/login_response_model.dart';

MarketCurrencyDataList marketCurrencyDataListFromJson(String str) => MarketCurrencyDataList.fromJson(json.decode(str));

String marketCurrencyDataListToJson(MarketCurrencyDataList data) => json.encode(data.toJson());

class MarketCurrencyDataList {
    String? remark;
    String? status;
    Message? message;
    Data? data;

    MarketCurrencyDataList({
        this.remark,
        this.status,
        this.message,
        this.data,
    });

    factory MarketCurrencyDataList.fromJson(Map<String, dynamic> json) => MarketCurrencyDataList(
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
    List<CurrencyMarket>? markets;

    Data({
        this.markets,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        markets: json["markets"] == null ? [] : List<CurrencyMarket>.from(json["markets"]!.map((x) => CurrencyMarket.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "markets": markets == null ? [] : List<dynamic>.from(markets!.map((x) => x.toJson())),
    };
}

class CurrencyMarket {
    int? id;
    String? name;
    String? currencyId;
    String? status;
    String? createdAt;
    String? updatedAt;
    Currency? currency;

    CurrencyMarket({
        this.id,
        this.name,
        this.currencyId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.currency,
    });

    factory CurrencyMarket.fromJson(Map<String, dynamic> json) => CurrencyMarket(
        id: json["id"],
        name: json["name"].toString(),
        currencyId: json["currency_id"].toString(),
        status: json["status"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
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

class Currency {
    int? id;
    String? name;
    String? symbol;
    String? imageUrl;

    Currency({
        this.id,
        this.name,
        this.symbol,
        this.imageUrl,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        name: json["name"].toString(),
        symbol: json["symbol"].toString(),
        imageUrl: json["image_url"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "image_url": imageUrl,
    };
}
