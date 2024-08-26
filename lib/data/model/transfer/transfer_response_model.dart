// To parse this JSON data, do
//
//     final transferResponseModel = transferResponseModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';

TransferResponseModel transferResponseModelFromJson(String str) => TransferResponseModel.fromJson(json.decode(str));

String transferResponseModelToJson(TransferResponseModel data) => json.encode(data.toJson());

class TransferResponseModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  TransferResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory TransferResponseModel.fromJson(Map<String, dynamic> json) => TransferResponseModel(
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
  TransferTransactionData? transaction;
  ToWallet? toWallet;
  String? amount;
  String? chargeAmount;
  Data({
    this.transaction,
    this.toWallet,
    this.amount,
    this.chargeAmount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        transaction: json["transaction"] == null ? null : TransferTransactionData.fromJson(json["transaction"]),
        toWallet: json["to_wallet"] == null ? null : ToWallet.fromJson(json["to_wallet"]),
        amount: json["amount"].toString(),
        chargeAmount: json["charge_amount"].toString(),
      );

  Map<String, dynamic> toJson() => {"transaction": transaction?.toJson(), "to_wallet": toWallet?.toJson(), "amount": amount, "charge_amount": chargeAmount};
}

class TransferTransactionData {
  String? userId;
  String? walletId;
  String? amount;
  String? postBalance;
  String? charge;
  String? trxType;
  String? details;
  String? trx;
  String? remark;
  String? updatedAt;
  String? createdAt;
  String? id;

  TransferTransactionData({
    this.userId,
    this.walletId,
    this.amount,
    this.postBalance,
    this.charge,
    this.trxType,
    this.details,
    this.trx,
    this.remark,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory TransferTransactionData.fromJson(Map<String, dynamic> json) => TransferTransactionData(
        userId: json["user_id"].toString(),
        walletId: json["wallet_id"].toString(),
        amount: json["amount"].toString(),
        postBalance: json["post_balance"].toString(),
        charge: json["charge"].toString(),
        trxType: json["trx_type"].toString(),
        details: json["details"].toString(),
        trx: json["trx"].toString(),
        remark: json["remark"].toString(),
        updatedAt: json["updated_at"].toString(),
        createdAt: json["created_at"].toString(),
        id: json["id"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "wallet_id": walletId,
        "amount": amount,
        "post_balance": postBalance,
        "charge": charge,
        "trx_type": trxType,
        "details": details,
        "trx": trx,
        "remark": remark,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
      };
}

class ToWallet {
  String? id;
  String? userId;
  String? currencyId;
  String? balance;
  String? walletType;
  String? createdAt;
  String? updatedAt;

  ToWallet({
    this.id,
    this.userId,
    this.currencyId,
    this.balance,
    this.walletType,
    this.createdAt,
    this.updatedAt,
  });

  factory ToWallet.fromJson(Map<String, dynamic> json) => ToWallet(
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
