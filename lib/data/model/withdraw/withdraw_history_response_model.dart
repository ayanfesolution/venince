// To parse this JSON data, do
//
//     final withdrawHistoryResponseModel = withdrawHistoryResponseModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';

WithdrawHistoryResponseModel withdrawHistoryResponseModelFromJson(String str) => WithdrawHistoryResponseModel.fromJson(json.decode(str));

String withdrawHistoryResponseModelToJson(WithdrawHistoryResponseModel data) => json.encode(data.toJson());

class WithdrawHistoryResponseModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  WithdrawHistoryResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory WithdrawHistoryResponseModel.fromJson(Map<String, dynamic> json) => WithdrawHistoryResponseModel(
        remark: json["remark"].toString(),
        status: json["status"].toString(),
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
  Withdrawals? withdrawals;
  String? imagePath;

  Data({
    this.withdrawals,
    this.imagePath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        withdrawals: json["withdrawals"] == null ? null : Withdrawals.fromJson(json["withdrawals"]),
        imagePath: json["path"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "withdrawals": withdrawals?.toJson(),
        "path": imagePath,
      };
}

class Withdrawals {
  List<WithdrawListModel>? data;
  String? nextPageUrl;
  String? path;

  Withdrawals({
    this.data,
    this.nextPageUrl,
    this.path,
  });

  factory Withdrawals.fromJson(Map<String, dynamic> json) => Withdrawals(
        data: json["data"] == null ? [] : List<WithdrawListModel>.from(json["data"]!.map((x) => WithdrawListModel.fromJson(x))),
        nextPageUrl: json["next_page_url"].toString(),
        path: json["path"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
      };
}

class WithdrawListModel {
  int? id;
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
  List<WithdrawInformationData>? withdrawInformation;
  String? adminFeedback;
  String? createdAt;
  String? updatedAt;
  Method? method;
  Wallet? wallet;

  WithdrawListModel({
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
    this.withdrawInformation,
    this.status,
    this.adminFeedback,
    this.createdAt,
    this.updatedAt,
    this.method,
    this.wallet,
  });

  factory WithdrawListModel.fromJson(Map<String, dynamic> json) => WithdrawListModel(
        id: json["id"],
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
        withdrawInformation: json["withdraw_information"] == null ? [] : List<WithdrawInformationData>.from(json["withdraw_information"]!.map((x) => WithdrawInformationData.fromJson(x))),
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
        "withdraw_information": withdrawInformation == null ? [] : List<dynamic>.from(withdrawInformation!.map((x) => x.toJson())),
        "status": status,
        "admin_feedback": adminFeedback,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "method": method?.toJson(),
        "wallet": wallet?.toJson(),
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

class Wallet {
  int? id;
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
        id: json["id"],
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

class WithdrawInformationData {
  String? name;
  String? type;
  String? value;

  WithdrawInformationData({
    this.name,
    this.type,
    this.value,
  });

  factory WithdrawInformationData.fromJson(Map<String, dynamic> json) => WithdrawInformationData(
        name: json["name"],
        type: json["type"],
        value: json["value"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "value": value,
      };
}
