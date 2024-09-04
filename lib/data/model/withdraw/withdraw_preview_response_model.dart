import 'package:flutter/foundation.dart';
import 'package:vinance/data/model/kyc/kyc_form_model.dart';
import 'package:vinance/data/model/user/user_model.dart';
import '../../../core/helper/string_format_helper.dart';
import '../auth/sign_up_model/registration_response_model.dart';

class WithdrawConfirmResponseModel {
  WithdrawConfirmResponseModel({String? remark, String? status, Message? message, Data? data}) {
    _remark = remark;
    _status = status;
    _message = message;
    _data = data;
  }

  WithdrawConfirmResponseModel.fromJson(dynamic json) {
    _remark = json['remark'];
    _status = json['status'];
    _message = json['message'] != null ? Message.fromJson(json['message']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _remark;
  String? _status;
  Message? _message;
  Data? _data;

  String? get remark => _remark;
  String? get status => _status;
  Message? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['remark'] = _remark;
    map['status'] = _status;
    if (_message != null) {
      map['message'] = _message?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({WithdrawPreviewData? withdraw, Form? form}) {
    _withdraw = withdraw;
    _form = form;
  }

  Data.fromJson(dynamic json) {
    _withdraw = json['withdraw'] != null ? WithdrawPreviewData.fromJson(json['withdraw']) : null;
    _form = json['form'] != null ? Form.fromJson(json['form']) : null;
  }

  WithdrawPreviewData? _withdraw;
  Form? _form;

  WithdrawPreviewData? get withdraw => _withdraw;
  Form? get form => _form;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_withdraw != null) {
      map['withdraw'] = _withdraw?.toJson();
    }
    if (_form != null) {
      map['form'] = _form?.toJson();
    }
    return map;
  }
}

class Form {
  Form({
    int? id,
    String? act,
    FormData? formData,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _act = act;
    _formData = formData;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Form.fromJson(dynamic json) {
    _id = json['id'];
    _act = json['act'];
    _formData = json['form_data'] != null ? FormData.fromJson(json['form_data']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _act;
  FormData? _formData;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get act => _act;
  FormData? get formData => _formData;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['act'] = _act;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

class FormData {
  FormData({List<KycFormModel>? list}) {
    _list = list;
  }

  List<KycFormModel>? _list = [];

  List<KycFormModel>? get list => _list;

  FormData.fromJson(dynamic json) {
    var map = Map.from(json).map((key, value) => MapEntry(key, value));

    try {
      List<KycFormModel>? list = map.entries
          .map(
            (e) => KycFormModel(e.value['name'], e.value['label'], e.value['is_required'], e.value['instruction'], e.value['extensions'], (e.value['options'] as List).map((e) => e as String).toList(), e.value['type'], ''),
          )
          .toList();

      if (list.isNotEmpty) {
        list.removeWhere((element) => element.toString().isEmpty);
        _list?.addAll(list);
      }
      _list;
    } catch (e) {
      if (kDebugMode) {
        printx(e.toString());
      }
    }
  }
}

class WithdrawPreviewData {
  WithdrawPreviewData({int? id, String? methodId, String? userId, String? amount, String? currency, String? rate, String? charge, String? trx, String? finalAmount, String? afterCharge, dynamic withdrawInformation, String? status, dynamic adminFeedback, String? branchId, String? branchStaffId, String? createdAt, String? updatedAt, Method? method, User? user}) {
    _id = id;
    _methodId = methodId;
    _userId = userId;
    _amount = amount;
    _currency = currency;
    _rate = rate;
    _charge = charge;
    _trx = trx;
    _finalAmount = finalAmount;
    _afterCharge = afterCharge;
    _withdrawInformation = withdrawInformation;
    _status = status;
    _adminFeedback = adminFeedback;
    _branchId = branchId;
    _branchStaffId = branchStaffId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _method = method;
    _user = user;
  }

  WithdrawPreviewData.fromJson(dynamic json) {
    _id = json['id'];
    _methodId = json['method_id'].toString();
    _userId = json['user_id'].toString();
    _amount = json['amount'] != null ? json['amount'].toString() : '';
    _currency = json['currency'] != null ? json['currency'].toString() : '';
    _rate = json['rate'] != null ? json['rate'].toString() : '';
    _charge = json['charge'] != null ? json['charge'].toString() : '';
    _trx = json['trx'] != null ? json['trx'].toString() : '';
    _finalAmount = json['final_amount'] != null ? json['final_amount'].toString() : '';
    _afterCharge = json['after_charge'] != null ? json['after_charge'].toString() : '';
    _withdrawInformation = json['withdraw_information'].toString();
    _status = json['status'].toString();
    _adminFeedback = json['admin_feedback'].toString();
    _branchId = json['branch_id'].toString();
    _branchStaffId = json['branch_staff_id'].toString();
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _method = json['method'] != null ? Method.fromJson(json['method']) : null;
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  int? _id;
  String? _methodId;
  String? _userId;
  String? _amount;
  String? _currency;
  String? _rate;
  String? _charge;
  String? _trx;
  String? _finalAmount;
  String? _afterCharge;
  dynamic _withdrawInformation;
  String? _status;
  dynamic _adminFeedback;
  String? _branchId;
  String? _branchStaffId;
  String? _createdAt;
  String? _updatedAt;
  Method? _method;
  User? _user;

  int? get id => _id;
  String? get methodId => _methodId;
  String? get userId => _userId;
  String? get amount => _amount;
  String? get currency => _currency;
  String? get rate => _rate;
  String? get charge => _charge;
  String? get trx => _trx;
  String? get finalAmount => _finalAmount;
  String? get afterCharge => _afterCharge;
  dynamic get withdrawInformation => _withdrawInformation;
  String? get status => _status;
  dynamic get adminFeedback => _adminFeedback;
  String? get branchId => _branchId;
  String? get branchStaffId => _branchStaffId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Method? get method => _method;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['method_id'] = _methodId;
    map['user_id'] = _userId;
    map['amount'] = _amount;
    map['currency'] = _currency;
    map['rate'] = _rate;
    map['charge'] = _charge;
    map['trx'] = _trx;
    map['final_amount'] = _finalAmount;
    map['after_charge'] = _afterCharge;
    map['withdraw_information'] = _withdrawInformation;
    map['status'] = _status;
    map['admin_feedback'] = _adminFeedback;
    map['branch_id'] = _branchId;
    map['branch_staff_id'] = _branchStaffId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_method != null) {
      map['method'] = _method?.toJson();
    }
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}

class Method {
  Method({int? id, String? formId, String? name, String? minLimit, String? maxLimit, String? fixedCharge, String? rate, String? percentCharge, String? currency, String? description, String? status, String? createdAt, String? updatedAt, Form? form}) {
    _id = id;
    _formId = formId;
    _name = name;
    _minLimit = minLimit;
    _maxLimit = maxLimit;
    _fixedCharge = fixedCharge;
    _rate = rate;
    _percentCharge = percentCharge;
    _currency = currency;
    _description = description;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _form = form;
  }

  Method.fromJson(dynamic json) {
    _id = json['id'];
    _formId = json['form_id'].toString();
    _name = json['name'] != null ? json['name'].toString() : '';
    _minLimit = json['min_limit'] != null ? json['max_limit'].toString() : '';
    _maxLimit = json['max_limit'] != null ? json['max_limit'].toString() : '';
    _fixedCharge = json['fixed_charge'] != null ? json['fixed_charge'].toString() : '';
    _rate = json['rate'] != null ? json['rate'].toString() : '';
    _percentCharge = json['percent_charge'] != null ? json['percent_charge'].toString() : '';
    _currency = json['currency'] != null ? json['currency'].toString() : '';
    _description = json['description'].toString();
    _status = json['status'] != null ? json['status'].toString() : '';
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _form = json['form'] != null ? Form.fromJson(json['form']) : null;
  }
  int? _id;
  String? _formId;
  String? _name;
  String? _minLimit;
  String? _maxLimit;
  String? _fixedCharge;
  String? _rate;
  String? _percentCharge;
  String? _currency;
  String? _description;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  Form? _form;

  int? get id => _id;
  String? get formId => _formId;
  String? get name => _name;
  String? get minLimit => _minLimit;
  String? get maxLimit => _maxLimit;
  String? get fixedCharge => _fixedCharge;
  String? get rate => _rate;
  String? get percentCharge => _percentCharge;
  String? get currency => _currency;
  String? get description => _description;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Form? get form => _form;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['form_id'] = _formId;
    map['name'] = _name;
    map['min_limit'] = _minLimit;
    map['max_limit'] = _maxLimit;
    map['fixed_charge'] = _fixedCharge;
    map['rate'] = _rate;
    map['percent_charge'] = _percentCharge;
    map['currency'] = _currency;
    map['description'] = _description;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_form != null) {
      map['form'] = _form?.toJson();
    }
    return map;
  }
}
