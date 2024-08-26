// To parse this JSON data, do
//
//     final referralScreenResponseModel = referralScreenResponseModelFromJson(jsonString);

import 'dart:convert';

import '../auth/login/login_response_model.dart';

ReferralScreenResponseModel referralScreenResponseModelFromJson(String str) => ReferralScreenResponseModel.fromJson(json.decode(str));

String referralScreenResponseModelToJson(ReferralScreenResponseModel data) => json.encode(data.toJson());

class ReferralScreenResponseModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  ReferralScreenResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory ReferralScreenResponseModel.fromJson(Map<String, dynamic> json) => ReferralScreenResponseModel(
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
  AllReferral? referrals;

  Data({
    this.referrals,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        referrals: json["referrals"] == null ? null : AllReferral.fromJson(json["referrals"]),
      );

  Map<String, dynamic> toJson() => {
        "referrals": referrals?.toJson(),
      };
}

class Referrer {
  String? id;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? countryCode;
  String? mobile;
  String? refBy;
  String? status;

  Referrer? referrer;
  List<AllReferral>? allReferrals;

  Referrer({
    this.id,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.countryCode,
    this.mobile,
    this.refBy,
    this.status,
    this.referrer,
    this.allReferrals,
  });

  factory Referrer.fromJson(Map<String, dynamic> json) => Referrer(
        id: json["id"].toString(),
        firstname: json["firstname"].toString(),
        lastname: json["lastname"].toString(),
        username: json["username"].toString(),
        email: json["email"].toString(),
        countryCode: json["country_code"].toString(),
        mobile: json["mobile"].toString(),
        refBy: json["ref_by"].toString(),
        status: json["status"].toString(),
        referrer: json["referrer"] == null ? null : Referrer.fromJson(json["referrer"]),
        allReferrals: json["all_referrals"] == null ? [] : List<AllReferral>.from(json["all_referrals"]!.map((x) => AllReferral.fromJson(x))),
      );
  String getFullName() {
    return "${firstname == 'null' ? '' : firstname} ${lastname == 'null' ? '' : lastname}";
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "country_code": countryCode,
        "mobile": mobile,
        "ref_by": refBy,
        "status": status,
        "referrer": referrer?.toJson(),
        "all_referrals": allReferrals == null ? [] : List<dynamic>.from(allReferrals!.map((x) => x.toJson())),
      };
}

class AllReferral {
  String? id;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? countryCode;
  String? mobile;
  String? refBy;
  String? status;

  Referrer? referrer;
  List<AllReferral>? allReferrals;

  AllReferral({
    this.id,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.countryCode,
    this.mobile,
    this.refBy,
    this.status,
    this.referrer,
    this.allReferrals,
  });

  factory AllReferral.fromJson(Map<String, dynamic> json) => AllReferral(
        id: json["id"].toString(),
        firstname: json["firstname"].toString(),
        lastname: json["lastname"].toString(),
        username: json["username"].toString(),
        email: json["email"].toString(),
        countryCode: json["country_code"].toString(),
        mobile: json["mobile"].toString(),
        refBy: json["ref_by"].toString(),
        status: json["status"].toString(),
        referrer: json["referrer"] == null ? null : Referrer.fromJson(json["referrer"]),
        allReferrals: json["all_referrals"] == null ? [] : List<AllReferral>.from(json["all_referrals"]!.map((x) => AllReferral.fromJson(x))),
      );
  String getFullName() {
    return "${firstname == 'null' ? '' : firstname} ${lastname == 'null' ? '' : lastname}";
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "country_code": countryCode,
        "mobile": mobile,
        "ref_by": refBy,
        "status": status,
        "referrer": referrer?.toJson(),
        "all_referrals": allReferrals == null ? [] : List<dynamic>.from(allReferrals!.map((x) => x.toJson())),
      };
}
