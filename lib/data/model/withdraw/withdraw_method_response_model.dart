// To parse this JSON data, do
//
//     final withdrawMethodResponseModel = withdrawMethodResponseModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';

WithdrawMethodResponseModel withdrawMethodResponseModelFromJson(String str) => WithdrawMethodResponseModel.fromJson(json.decode(str));

String withdrawMethodResponseModelToJson(WithdrawMethodResponseModel data) => json.encode(data.toJson());

class WithdrawMethodResponseModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  WithdrawMethodResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory WithdrawMethodResponseModel.fromJson(Map<String, dynamic> json) => WithdrawMethodResponseModel(
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
  List<WithdrawMethod>? withdrawMethod;
  List<WithdrawCurrency>? currencies;
  List<WithdrawWallet>? spotWallets;
  List<WithdrawWallet>? fundingWallets;

  Data({
    this.withdrawMethod,
    this.currencies,
    this.spotWallets,
    this.fundingWallets,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        withdrawMethod: json["withdrawMethod"] == null ? [] : List<WithdrawMethod>.from(json["withdrawMethod"]!.map((x) => WithdrawMethod.fromJson(x))),
        currencies: json["currencies"] == null ? [] : List<WithdrawCurrency>.from(json["currencies"]!.map((x) => WithdrawCurrency.fromJson(x))),
        spotWallets: json["spot_wallets"] == null ? [] : List<WithdrawWallet>.from(json["spot_wallets"]!.map((x) => WithdrawWallet.fromJson(x))),
        fundingWallets: json["funding_wallets"] == null ? [] : List<WithdrawWallet>.from(json["funding_wallets"]!.map((x) => WithdrawWallet.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "withdrawMethod": withdrawMethod == null ? [] : List<dynamic>.from(withdrawMethod!.map((x) => x.toJson())),
        "currencies": currencies == null ? [] : List<dynamic>.from(currencies!.map((x) => x.toJson())),
        "spot_wallets": spotWallets == null ? [] : List<dynamic>.from(spotWallets!.map((x) => x.toJson())),
        "funding_wallets": fundingWallets == null ? [] : List<dynamic>.from(fundingWallets!.map((x) => x.toJson())),
      };
}

class WithdrawCurrency {
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

  WithdrawCurrency({
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

  factory WithdrawCurrency.fromJson(Map<String, dynamic> json) => WithdrawCurrency(
        id: json["id"].toString(),
        type: json["type"].toString(),
        name: json["name"].toString(),
        sign: json["sign"].toString().toString(),
        symbol: json["symbol"].toString().toString(),
        image: json["image"].toString().toString(),
        rate: json["rate"].toString().toString(),
        rank: json["rank"].toString().toString(),
        status: json["status"].toString().toString(),
        highlightedCoin: json["highlighted_coin"].toString().toString(),
        p2PSn: json["p2p_sn"].toString().toString(),
        createdAt: json["created_at"].toString().toString(),
        updatedAt: json["updated_at"].toString().toString(),
        imageUrl: json["image_url"].toString().toString(),
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

class WithdrawMethod {
  int? id;
  String? formId;
  String? name;
  String? minLimit;
  String? maxLimit;
  String? fixedCharge;
  String? rate;
  String? percentCharge;
  String? currency;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;

  WithdrawMethod({
    this.id,
    this.formId,
    this.name,
    this.minLimit,
    this.maxLimit,
    this.fixedCharge,
    this.rate,
    this.percentCharge,
    this.currency,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory WithdrawMethod.fromJson(Map<String, dynamic> json) => WithdrawMethod(
        id: json["id"],
        formId: json["form_id"].toString(),
        name: json["name"].toString(),
        minLimit: json["min_limit"].toString(),
        maxLimit: json["max_limit"].toString(),
        fixedCharge: json["fixed_charge"].toString(),
        rate: json["rate"].toString(),
        percentCharge: json["percent_charge"].toString(),
        currency: json["currency"].toString(),
        description: json["description"].toString(),
        status: json["status"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "form_id": formId,
        "name": name,
        "min_limit": minLimit,
        "max_limit": maxLimit,
        "fixed_charge": fixedCharge,
        "rate": rate,
        "percent_charge": percentCharge,
        "currency": currency,
        "description": description,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class WithdrawWallet {
  int? id;
  String? balance;
  String? currencyId;
  WithdrawWalletCurrency? currency;

  WithdrawWallet({
    this.id,
    this.balance,
    this.currencyId,
    this.currency,
  });

  factory WithdrawWallet.fromJson(Map<String, dynamic> json) => WithdrawWallet(
        id: json["id"],
        balance: json["balance"].toString(),
        currencyId: json["currency_id"].toString(),
        currency: json["currency"] == null ? null : WithdrawWalletCurrency.fromJson(json["currency"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "balance": balance,
        "currency_id": currencyId,
        "currency": currency?.toJson(),
      };
}

class WithdrawWalletCurrency {
  int? id;
  String? name;
  String? symbol;
  String? image;
  String? imageUrl;

  WithdrawWalletCurrency({
    this.id,
    this.name,
    this.symbol,
    this.image,
    this.imageUrl,
  });

  factory WithdrawWalletCurrency.fromJson(Map<String, dynamic> json) => WithdrawWalletCurrency(
        id: json["id"],
        name: json["name"].toString(),
        symbol: json["symbol"].toString(),
        image: json["image"].toString(),
        imageUrl: json["image_url"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "image": image,
        "image_url": imageUrl,
      };
}
