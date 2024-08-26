// To parse this JSON data, do
//
//     final withdrawConfirmationResponseModel = withdrawConfirmationResponseModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';

WithdrawConfirmationResponseModel withdrawConfirmationResponseModelFromJson(String str) => WithdrawConfirmationResponseModel.fromJson(json.decode(str));

String withdrawConfirmationResponseModelToJson(WithdrawConfirmationResponseModel data) => json.encode(data.toJson());

class WithdrawConfirmationResponseModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  WithdrawConfirmationResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory WithdrawConfirmationResponseModel.fromJson(Map<String, dynamic> json) => WithdrawConfirmationResponseModel(
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
  WithdrawConfirmationData? withdraw;

  Data({
    this.withdraw,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        withdraw: json["withdraw"] == null ? null : WithdrawConfirmationData.fromJson(json["withdraw"]),
      );

  Map<String, dynamic> toJson() => {
        "withdraw": withdraw?.toJson(),
      };
}

class WithdrawConfirmationData {
  String? id;
  String? methodId;
  String? userId;
  String? amount;
  String? currency;
  String? walletId;
  String? rate;
  String? charge;
  String? trx;
  String? finalAmount;
  String? afterCharge;
  String? status;
  String? adminFeedback;
  Method? method;
  String? createdAt;
  String? updatedAt;

  Wallet? wallet;

  WithdrawConfirmationData({
    this.id,
    this.methodId,
    this.userId,
    this.amount,
    this.currency,
    this.walletId,
    this.rate,
    this.charge,
    this.trx,
    this.finalAmount,
    this.afterCharge,
    this.status,
    this.adminFeedback,
    this.createdAt,
    this.updatedAt,
    this.method,
    this.wallet,
  });

  factory WithdrawConfirmationData.fromJson(Map<String, dynamic> json) => WithdrawConfirmationData(
        id: json["id"].toString(),
        methodId: json["method_id"].toString(),
        userId: json["user_id"].toString(),
        amount: json["amount"].toString(),
        currency: json["currency"].toString(),
        walletId: json["wallet_id"].toString(),
        rate: json["rate"].toString(),
        charge: json["charge"].toString(),
        trx: json["trx"].toString(),
        finalAmount: json["final_amount"].toString(),
        afterCharge: json["after_charge"].toString(),
        status: json["status"].toString(),
        adminFeedback: json["admin_feedback"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        method: json["method"] == null ? null : Method.fromJson(json["method"]),
        wallet: json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "method_id": methodId,
        "user_id": userId,
        "amount": amount,
        "currency": currency,
        "wallet_id": walletId,
        "rate": rate,
        "charge": charge,
        "trx": trx,
        "final_amount": finalAmount,
        "after_charge": afterCharge,
        "status": status,
        "admin_feedback": adminFeedback,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "method": method?.toJson(),
        "wallet": wallet?.toJson(),
      };
}

class Wallet {
  String? id;
  String? userId;
  String? currencyId;
  String? balance;
  String? walletType;
  String? createdAt;
  String? updatedAt;

  Wallet({
    this.id,
    this.userId,
    this.currencyId,
    this.balance,
    this.walletType,
    this.createdAt,
    this.updatedAt,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"].toString(),
        userId: json["user_id"].toString(),
        currencyId: json["currency_id"].toString(),
        balance: json["balance"].toString(),
        walletType: json["wallet_type"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "currency_id": currencyId,
        "balance": balance,
        "wallet_type": walletType,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Method {
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

  Method({
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

  factory Method.fromJson(Map<String, dynamic> json) => Method(
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
