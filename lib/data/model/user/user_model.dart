class User {
  int? id;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? countryCode;
  String? mobile;
  String? refBy;
  String? country;
  String? address;
  String? state;
  String? zip;
  String? city;
  String? status;
  String? kv;
  String? ev;
  String? sv;
  String? profileComplete;
  String? verCodeSendAt;
  String? ts;
  String? tv;
  String? tsc;
  String? banReason;
  String? provider;
  String? image;
  String? metamaskWalletAddress;
  String? metamaskNonce;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.countryCode,
    this.mobile,
    this.refBy,
    this.country,
    this.address,
    this.state,
    this.zip,
    this.city,
    this.status,
    this.kv,
    this.ev,
    this.sv,
    this.profileComplete,
    this.verCodeSendAt,
    this.ts,
    this.tv,
    this.tsc,
    this.banReason,
    this.provider,
    this.image,
    this.metamaskWalletAddress,
    this.metamaskNonce,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"].toString() == 'null' ? '' : json["firstname"].toString(),
        lastname: json["lastname"].toString() == 'null' ? '' : json["lastname"].toString(),
        username: json["username"].toString() == 'null' ? '' : json["username"].toString(),
        email: json["email"].toString() == 'null' ? '' : json["email"].toString(),
        countryCode: json["country_code"].toString(),
        mobile: json["mobile"].toString() == 'null' ? '' : json["mobile"].toString(),
        refBy: json["ref_by"].toString(),
        country: json["country"].toString() == 'null' ? '' : json["country"].toString(),
        address: json["address"].toString() == 'null' ? '' : json["address"].toString(),
        state: json["state"].toString() == 'null' ? '' : json["state"].toString(),
        zip: json["zip"].toString() == 'null' ? '' : json["zip"].toString(),
        city: json["city"].toString() == 'null' ? '' : json["city"].toString(),
        status: json["status"].toString(),
        kv: json["kv"].toString(),
        ev: json["ev"].toString(),
        sv: json["sv"].toString(),
        profileComplete: json["profile_complete"].toString() == 'null' ? '0' : json["profile_complete"].toString(),
        verCodeSendAt: json["ver_code_send_at"].toString(),
        ts: json["ts"].toString(),
        tv: json["tv"].toString(),
        tsc: json["tsc"].toString(),
        banReason: json["ban_reason"].toString(),
        provider: json["provider"].toString(),
        image: json["image"].toString(),
        metamaskWalletAddress: json["metamask_wallet_address"].toString(),
        metamaskNonce: json["metamask_nonce"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );

  String getFullName() {
    return "${firstname == 'null' ? '' : firstname} ${lastname == 'null' ? '' : lastname}";
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname.toString(),
        "lastname": lastname.toString(),
        "username": username.toString(),
        "email": email.toString(),
        "country_code": countryCode.toString(),
        "mobile": mobile.toString(),
        "ref_by": refBy.toString(),
        "status": status.toString(),
        "country": country.toString(),
        "address": address.toString(),
        "state": state.toString(),
        "zip": zip.toString(),
        "city": city.toString(),
        "kv": kv.toString(),
        "ev": ev.toString(),
        "sv": sv.toString(),
        "profile_complete": profileComplete.toString(),
        "ver_code_send_at": verCodeSendAt.toString(),
        "ts": ts.toString(),
        "tv": tv.toString(),
        "tsc": tsc.toString(),
        "ban_reason": banReason.toString(),
        "provider": provider.toString(),
        "image": image.toString(),
        "metamask_wallet_address": metamaskWalletAddress.toString(),
        "metamask_nonce": metamaskNonce.toString(),
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
      };
}
